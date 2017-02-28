//ARQ1 - Eduardo Botelho de Andrade - Guia05

module grless (output gr,
               output ls,
               input [3:0] x,
               input [3:0] y);
               
  not not1 (w1,x[0]);
  not not2 (w2,x[1]);
  not not3 (w3,x[2]);
  not not4 (w4,x[3]);
  not not5 (w5,y[0]);
  not not6 (w6,y[1]);
  not not7 (w7,y[2]);
  not not8 (w8,y[3]);
  
  and and1 (s1,w1,y[0]);
  and and2 (s2,x[0],w5);
  and and3 (s3,w2,y[1]);
  and and4 (s4,x[1],w6);
  and and5 (s5,w3,y[2]);
  and and6 (s6,x[2],w7);
  and and7 (s7,w4,y[3]);
  and and8 (s8,x[3],w8);
  
  or or1 (ls,s1,s3,s5,s7);
  or or2 (gr,s2,s4,s6,s8);

endmodule