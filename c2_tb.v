`include "c2.v"

module simulate;
  wire [3:0]q;
  reg clk, reset;
  counter ripple(q,clk,reset);

  initial
    clk <= 1'b1;

  always begin
    #5 clk <= ~clk;
    #5 $monitor($time," q=%d ", q);
    $dumpfile("c2.vcd");
    $dumpvars(0, simulate);


  end

  initial begin
    reset <= 1'b0;
    #1 reset <= 1'b1;
    #25 reset <= 1'b1;
    #60 reset <= 1'b0;
    #200 $finish;
  end



endmodule
