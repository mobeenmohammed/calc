#include <iostream>
#include <string>

int main(int argc, char** argv) {
  if (argc == 2 && std::string(argv[1]) == "--hello") {
    std::cout << "hello from sv-calc\n";
    return 0;
  }

  std::cout << "sv-calc (WIP)\n";
  std::cout << "Usage: calc \"EXPR\"   (not implemented yet)\n";
  std::cout << "Try:   calc --hello\n";
  return 0;
}
