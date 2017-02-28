// ------------------------- 
// Exemplo0032 - Exemplo0032.v
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s1,  output [3:0] s2, output [3:0] s3,output [3:0] s4, output [3:0] sFim,
                    input  [3:0] a, 
                    input  [3:0] b,
						  input  [3:0] c); 
 
// descrever por portas 

assign s1 = a&b;
assign s2 = a|b;
assign s3 = s1&c;
assign s4 = s2&~c;
assign sFim = s3|s4;
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y;
		 reg  [3:0] w; 
       wire [3:0] z1;
		 wire [3:0] z2;
		 wire [3:0] z3;
		 wire [3:0] z4;
		 wire [3:0] zFim;
 
       f4 modulo ( z1, z2, z3, z4 , zFim, x, y, w); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0032 - Felipe Ferreira Andrade do Carmo - 427402"); 
      $display("Test LU's module"); 
 
      x = 4'b0011;       y = 4'b0101;  w = 4'b0000; 
 
   // projetar testes do modulo 
	$display("\n  a \t  b \t Chave\t  Resultado");
   #1 $display("%3b    %3b      %3b    %3b",x,y,w,zFim);

 
   end 
 
endmodule // test_f4 