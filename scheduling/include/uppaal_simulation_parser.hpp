#ifndef UPPAAL_SIMULATION_PARSER_H
#define UPPAAL_SIMULATION_PARSER_H

#include <iostream>
#include <string>
#include <utility>
#include <vector>

namespace scheduling {

struct FormulaNotSatisfiedException : public std::exception {
    const char *what() const noexcept override { return "Formula not satisfied"; }
};

class SimulationParseException : public std::exception {
    std::string message;

  public:
    SimulationParseException(const std::string &inmessage) { message = inmessage; }

    const char *what() const noexcept override { return message.c_str(); }
};

struct Run {
    int number;
    std::vector<std::pair<double, int>> values;
};

struct SimulationValue {
    std::string name;
    std::vector<Run> runs;
};

class UppaalSimulationParser {
  public:
    std::vector<SimulationValue> parse(std::string result, int formula_number);

  private:
    SimulationValue parseValue(std::istream &ss, std::string &line);
};

} // namespace scheduling

#endif // UPPAAL_SIMULATION_PARSER_H
