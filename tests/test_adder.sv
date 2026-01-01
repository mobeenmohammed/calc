`timescale 1ns/1ps

module test_adder;
  logic signed [31:0] a, b;
  logic signed [31:0] sum;
  logic overflow;

  adder dut (
    .a(a), .b(b), .sum(sum), .overflow(overflow)
  );

  task automatic check(
    input logic signed [31:0] aa,
    input logic signed [31:0] bb,
    input logic signed [31:0] exp_sum,
    input logic exp_overflow
  );
    begin
      a = aa; b = bb;
      #1; // small settle delay
      if (sum !== exp_sum || overflow !== exp_overflow) begin
        $display("FAIL: a=%0d b=%0d got sum=%0d ov=%0b expected sum=%0d ov=%0b",
                 a, b, sum, overflow, exp_sum, exp_overflow);
        $fatal(1);
      end else begin
        $display("PASS: a=%0d b=%0d sum=%0d ov=%0b", a, b, sum, overflow);
      end
    end
  endtask

  initial begin
    check(10, 5, 15, 0);
    check(-10, 5, -5, 0);
    check(32'sh7fffffff, 1, 32'sh80000000, 1);
    check(0, 0, 0, 0);
    $finish;
  end
endmodule
