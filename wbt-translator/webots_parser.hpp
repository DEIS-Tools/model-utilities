#ifndef WEBOTS_PARSER_H
#define WEBOTS_PARSER_H

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>

class EndOfStreamException : public std::exception{
    std::string message;
public:
    EndOfStreamException(const std::string inmessage){
        message = inmessage;
    }

    const char* what() const noexcept override{
        return message.c_str();
    }
};
class MalformedWorldFileError : public std::exception{
    std::string message;
public:
    MalformedWorldFileError(const std::string inmessage){
        message = inmessage;
    }

    const char* what() const noexcept override{
        return message.c_str();
    }
};

struct Translation {
    double x, y, z;
};

enum WaypointType {eWaypoint, eStation, eEndPoint};

struct Waypoint {
    int id;
  std::vector<int> adjList;
    Translation translation;
    WaypointType waypointType;
};


struct AST {
    std::map<size_t, Waypoint> nodes;

    bool are_connected(size_t i, size_t j) const {
        auto start = nodes.find(i);
        if (start != std::end(nodes)) {
            std::vector<int> adjList = start->second.adjList;
            //Does the adjList contain the element j?
            return std::find(std::begin(adjList), std::end(adjList), j) != std::end(adjList);
        } else {
            throw MalformedWorldFileError("The waypoint " + std::to_string(i) + " Could not be found");
        }
    }
};

class Parser {
  public:
    AST parse_stream();
  Parser(std::istream& inputStream)
    :stream(inputStream){}
  private:
    std::istream& stream;
    AST ast;

    std::string read_token();
  std::string read_string();
  Waypoint parse_waypoint(std::string);
  Translation parse_translation();
  int parse_id();
  std::vector<int> parse_adjList();

};



#endif
