// Nome: Rayan Darwin
// Matricula: 412700

module norgate(output s, input a, input b);
 assign s = ~(a | b);
endmodule

module teste;
 reg x,y;
 wire z;
 
 norgate NOR1 (z,x,y);
 
 initial begin
  x=0; y=0;
  $display("Teste\nx y z");
  $monitor("%b %b %b",x,y,z);
  
  #1 x=0; y=1;
  #1 x=1; y=0;
  #1 x=1; y=1;
 end
 
endmodule