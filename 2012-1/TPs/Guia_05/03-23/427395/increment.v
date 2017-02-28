//ARQ1 - Eduardo Botelho de Andrade - Guia05

`include "fa.v"

module increment (output [3:0] s,
                  output overflow,
                  input [3:0] x,
                  input inca,
                  input incb);

  fa fa1 (s[0],w1,inca,incb,x[3]);
  fa fa2 (s[1],w2,x[0],0,w1);
  fa fa3 (s[2],w3,x[1],0,w2);
  fa fa4 (s[3],overflow,x[2],0,w3);

endmodule