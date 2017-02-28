// -------------------------
// Exercicio03
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------

module xnorgate(output s, input a, input b);
 assign s = ~(a ^ b);
endmodule

module teste;
 reg x,y;
 wire z;
 
 xnorgate XNOR1 (z,x,y);
 
 initial begin
  x=0; y=0;
  $display("Teste\nx y z");
  $monitor("%b %b %b",x,y,z);
  
  #1 x=0; y=1;
  #1 x=1; y=0;
  #1 x=1; y=1;
 end
 
endmodule