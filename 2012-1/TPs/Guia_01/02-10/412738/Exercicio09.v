// Nome: Felipe Torres
// Matricula: 412738

// UMA SAIDA, NAO DUAS !


module andgate(output s, output r, input a, input b, input c);
 assign s = (a & b);
 assign r = (s & c);
endmodule

module teste;
 reg x,y,w;
 wire z,t;
 
 andgate AND1 (z,t,x,y,w);
 
 initial begin
  x=0; y=0; w=0;
  $display("Teste\nx y w t");
  $monitor("%b %b %b %b",x,y,w,t);
  
  #1 x=0; y=0; w=1;
  #1 x=0; y=1; w=0;
  #1 x=0; y=1; w=1;
  #1 x=1; y=0; w=0;
  #1 x=1; y=0; w=1;
  #1 x=1; y=1; w=0;
  #1 x=1; y=1; w=1;
 end
 
endmodule