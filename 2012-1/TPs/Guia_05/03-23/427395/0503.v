//ARQ1 - Eduardo Botelho de Andrade - Guia05

`include "increment.v"

module alu1 (output [3:0] s,
             output overflow,
             input [3:0] a,
             input [3:0] b,
             input inca,
             input incb);
  
  wire [3:0] k;

  xor xor1 (x1,a[3],b[3]);
  fa fa1 (k[0],w1,a[0],b[0],x1);
  fa fa2 (k[1],w2,a[1],b[1],w1);
  fa fa3 (k[2],k[3],a[2],b[2],w2);

  increment inc1 (s,overflow,k,inca,incb);

endmodule
