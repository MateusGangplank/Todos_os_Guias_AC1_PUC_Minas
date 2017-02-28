// -------------------------
// Exercicio08
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------

module andgate(output s, input a, input b, input c, input d);
 assign s = (a & b) & (c & d);
endmodule

module teste;
 reg x,y,w,z;
 wire s;
 
 andgate AND1 (s,x,y,w,z);
 
 initial begin
  x=0; y=0; w=0; z=0;
  $display("Teste\nx y w z s");
  $monitor("%b %b %b %b %b",x,y,w,z,s);
  
  #1 x=0; y=0; w=0; z=1;
  #1 x=0; y=0; w=1; z=0;
  #1 x=0; y=0; w=1; z=1;
  #1 x=0; y=1; w=0; z=0;
  #1 x=0; y=1; w=0; z=1;
  #1 x=0; y=1; w=1; z=0;
  #1 x=0; y=1; w=1; z=1;
  #1 x=1; y=0; w=0; z=0;
  #1 x=1; y=0; w=0; z=1;
  #1 x=1; y=0; w=1; z=0;
  #1 x=1; y=0; w=1; z=1;
  #1 x=1; y=1; w=0; z=0;
  #1 x=1; y=1; w=0; z=1;
  #1 x=1; y=1; w=1; z=0;
  #1 x=1; y=1; w=1; z=1;
 end
 
endmodule