`timescale 1ns/1ps

module alu (
  input  logic signed [31:0] a,
  input  logic signed [31:0] b,
  input  logic [1:0]          op,
  output logic signed [31:0]  y
);
  // Placeholder: SV core will be used later via Verilator
  always_comb y = '0;
endmodule
