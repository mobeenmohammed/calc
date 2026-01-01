# -----------------------------
# Tooling
# -----------------------------
CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra
VERILATOR ?= verilator

# -----------------------------
# Paths
# -----------------------------
BUILD_DIR := build

# C++ CLI
CLI_BIN := $(BUILD_DIR)/calc
CLI_SRC := sim/main.cpp

# SystemVerilog tests (Verilator)
SV_BUILD_DIR := build
SV_OBJ_DIR := $(SV_BUILD_DIR)/obj_dir
SV_ADDER_BIN := $(SV_BUILD_DIR)/test_adder
SV_ADDER_TOP := test_adder
SV_ADDER_SRCS := rtl/adder.sv tests/test_adder.sv

# -----------------------------
# Phony targets
# -----------------------------
.PHONY: all clean test cli svtest svclean

# Default: build CLI
all: cli

# -----------------------------
# C++ CLI build
# -----------------------------
cli: $(CLI_BIN)

$(CLI_BIN): $(CLI_SRC)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(CLI_BIN) $(CLI_SRC)

# -----------------------------
# SystemVerilog: run testbench with Verilator
# -----------------------------
svtest:
	@mkdir -p $(SV_BUILD_DIR)
	$(VERILATOR) -Wall --sv --timing --binary \
	  -Mdir $(SV_OBJ_DIR) \
	  -o ../test_adder \
	  $(SV_ADDER_SRCS) --top-module $(SV_ADDER_TOP)
	@$(SV_ADDER_BIN)

svclean:
	rm -rf $(SV_OBJ_DIR) $(SV_ADDER_BIN)

# -----------------------------
# Tests (CLI tests + SV tests)
# -----------------------------
test: cli svtest
	@chmod +x tests/run_tests.sh
	@tests/run_tests.sh

# -----------------------------
# Clean
# -----------------------------
clean:
	rm -rf $(BUILD_DIR)
