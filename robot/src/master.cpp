#include <fstream>

#include "robot/config.hpp"
#include "robot/info.hpp"
#include "robot/master.hpp"
#include "tcp/client.hpp"
#include "wbt-translator/apsp.hpp"
#include "wbt-translator/distance_matrix.hpp"
#include "wbt-translator/webots_parser.hpp"

#define PORT_TO_BROADCASTER "5435"
#define PORT_TO_PDS "4444"

robot::Master::Master(const std::string &robot_host, const std::string &broadcast_host,
                      int robot_id, std::istream &world_file)
    : broadcast_client(broadcast_host, PORT_TO_BROADCASTER), webots_parser(world_file)
{
    std::string port_to_controller;
    std::vector<std::string> recieved_strings;

    // Connecting to the Port Discovery Service
    tcp::Client PDSClient{robot_host, PORT_TO_PDS};
    PDSClient.send("get_robot," + std::to_string(robot_id));
    do {
        recieved_strings = PDSClient.receive();
    } while (recieved_strings.size() == 0);
    if (recieved_strings.size() == 1) {
        port_to_controller = recieved_strings[0];
    }
    else {
        throw robot::RecievedMessageException{"Recieved" + std::to_string(recieved_strings.size()) +
                                              "messages while only one was expected."};
    }

    // Connecting to the WeBots Controller
    // webot_client = std::make_unique<tcp::Client>(robot_host, port_to_controller);
}

void robot::Master::load_webots_to_config(std::filesystem::path input_file)
{
    std::ifstream infile(input_file);
    if (!infile.is_open()) {
        std::cerr << "The file " << input_file << " could not be opened.\n";
        exit(1);
    }
    Parser parser = Parser(infile);
    AST ast = parser.parse_stream();

    if (ast.nodes.size() == 0) {
        std::cerr << "Malformed world file. No waypoints found." << std::endl;
        exit(1);
    }

    std::cerr << "number of nodes" << ast.nodes.size() << std::endl;

    std::vector<int> stations;
    std::vector<int> end_stations;
    std::vector<int> vias;
    for (auto &[id, waypoint] : ast.nodes) {
        switch (waypoint.waypointType) {
        case WaypointType::eStation:
            stations.push_back(id);
            break;
        case WaypointType::eEndPoint:
            end_stations.push_back(id);
            break;
        case WaypointType::eVia:
            vias.push_back(id);
            break;
        default:
            throw std::runtime_error{""};
        }
    }

    // Get number of stations, endpoints and waypoint
    int station_count = stations.size(), endpoint_count = end_stations.size(),
        via_count = vias.size();

    std::for_each(std::begin(stations), std::end(stations),
                  [](auto station) { std::cerr << station << '\n'; });
    static_config.set("stations", stations);
    static_config.set("end_stations", end_stations);
    static_config.set("vias", vias);
    static_config.set("number_of_stations", station_count);
    static_config.set("number_of_end_stations", endpoint_count);
    static_config.set("number_of_vias", via_count);
    static_config.set("number_of_waypoints", station_count + endpoint_count + via_count);
    static_config.set("number_of_robots", parser.number_of_robots);

    // Get distance matrix for waypoints
    std::vector<std::vector<double>> waypoint_matrix = distance_matrix{ast}.get_data();

    // Get distance matrix for stations
    std::map<int, std::map<int, double>> apsp_distances = all_pairs_shortest_path(ast).dist;

    Json::Value jsonarray_waypoint_matrix{Json::arrayValue};
    size_t columns = waypoint_matrix.front().size();
    size_t rows = waypoint_matrix.size();
    size_t count = 0;
    for (std::size_t i = 0; i < rows; i++) {
        for (size_t h = 0; h < columns; h++) {
            jsonarray_waypoint_matrix.append(waypoint_matrix[i][h]);
            count++;
        }
    }

    static_config.set("waypoint_distance_matrix", jsonarray_waypoint_matrix);

    // TODO set station matrix
    Json::Value jsonarray_apsp_distances{Json::arrayValue};
    count = 0;
    columns = apsp_distances.at(1).size();
    rows = apsp_distances.size();
    for (size_t i = 0; i < rows; i++) {
        for (size_t h = 0; h < columns; h++) {
            if (ast.nodes.at(i).waypointType == WaypointType::eStation &&
                ast.nodes.at(h).waypointType == WaypointType::eStation) {
                jsonarray_apsp_distances.append(apsp_distances.at(i).at(h));
            }
        }
    }

    Json::Value waypoint_list{Json::arrayValue};
    for (auto &[id, waypoint] : ast.nodes) {
        waypoint_list.append(Json::objectValue);
        auto &last = waypoint_list[waypoint_list.size() - 1];
        last["id"] = id;
        last["x"] = waypoint.translation.x;
        last["z"] = waypoint.translation.z;
        last["type"] = to_string(waypoint.waypointType);
        last["adjList"] = Json::arrayValue;
        std::for_each(std::begin(waypoint.adjlist), std::end(waypoint.adjlist),
                      [&last](int adj) { last["adjList"].append(adj); });
    }
    static_config.set("waypoints", waypoint_list);
    static_config.set("station_distance_matrix", jsonarray_apsp_distances);
}

void robot::Master::request_broadcast_info()
{
    broadcast_client.send("get_robot_locations");
}

void robot::Master::send_robot_info(int robot_id, Info robot_info)
{
    broadcast_client.send("post_robot_location, " + robot_info.to_json().toStyledString());
}

std::string robot::Master::recv_broadcast_info()
{
    std::vector<std::string> strings_from_broadcaster;
    strings_from_broadcaster = broadcast_client.receive();

    // Gets the latest info from the broadcaster
    return strings_from_broadcaster.back();
}

void robot::Master::write_static_config(const std::filesystem::path &path)
{
    static_config.write_to_file(path.c_str());
}

void robot::Master::write_dynamic_config(const std::filesystem::path &path)
{
    dynamic_config.write_to_file(path.c_str());
}