`timescale 1ns/1ps

module adder (
    input logic signed [31:0] a,
    input logic signed [31:0] b,
    output logic signed [31:0] sum,
    output logic overflow
);

  always_comb begin
    sum = a + b;
    overflow = (a[31] == b[31]) && (sum[31] != a[31]);
  end

endmodule

