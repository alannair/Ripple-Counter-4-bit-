module Tff (q,t,reset);
  output q;
  input t,reset;
  reg q;

  always @ ( negedge t ) begin
    q <= ~q;
  end

  always @ ( posedge reset ) begin
    q <= 1'b0;
  end
endmodule //Tff
module counter(q,clk,reset);
  output [3:0]q;
  input clk;
  input reset;

  Tff t0(q[0],clk,reset);
  Tff t1(q[1],q[0],reset);
  Tff t2(q[2],q[1],reset);
  Tff t3(q[3],q[2],reset);
endmodule
