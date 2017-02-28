// Exercicio 11
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

//
module gate (output s,
                         input  [0:7] p);
assign s = (((((((p[0] | p[1]) | p[2]) | p[3]) | p[4]) | p[5]) | p[6]) | p[7]);
endmodule 

module testgate;
   reg  [0:7] a;
	wire s;  
   gate azase (s, a);
   initial begin:start
	a=8'b10101010; 
   end
   initial begin:main
         $monitor("%b = %b", a, s);
  #1     a=8'b00000000; 
  #1     a=8'b11111111; 
  #1     a=8'b00010000; 
  #1     a=8'b11101111;
  #1     a=8'b00011000; 
  #1     a=8'b10111111;
  #1     a=8'b01000000; 
  #1     a=8'b00111111;
  #1     a=8'b11000000; 
  #1     a=8'b11111100;
  #1     a=8'b00000011; 
  #1     a=8'b11111010;
  #1     a=8'b00000101; 
  #1     a=8'b11101011;
  #1     a=8'b00011010; 
  #1     a=8'b11011011;
  end
endmodule