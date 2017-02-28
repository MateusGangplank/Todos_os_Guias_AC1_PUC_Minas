//ARQ1 - Eduardo Botelho de Andrade - Guia05

`include "fa.v"

module alu1 (output [3:0] s,
             input [3:0] a,
             input [3:0] b);
   
  xor xor1 (x1,a[3],b[3]);
  fa fa1 (s[0],w1,a[0],b[0],x1);
  fa fa2 (s[1],w2,a[1],b[1],w1);
  fa fa3 (s[2],s[3],a[2],b[2],w2);

endmodule
