CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra

BUILD_DIR := build

.PHONY: all clean test

all: $(BUILD_DIR)/calc

$(BUILD_DIR)/calc: sim/main.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/calc sim/main.cpp

test: all
	@chmod +x tests/run_tests.sh
	@tests/run_tests.sh

clean:
	rm -rf $(BUILD_DIR)
