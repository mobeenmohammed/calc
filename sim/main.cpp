#include <iostream>
#include <string>

int main(int argc, char** argv) {
  if (argc == 2 && std::string(argv[1]) == "--hello") {
    std::cout << "hello from calc\n";
    return 0;
  }

  std::cout << "calc (WIP)\n";
  std::cout << "Usage: calc \"EXPR\"   (not implemented yet)\n";
  std::cout << "Try:   calc --hello\n";
  return 0;
}
