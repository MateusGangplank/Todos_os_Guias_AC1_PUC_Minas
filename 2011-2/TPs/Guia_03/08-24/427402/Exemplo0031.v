// ------------------------- 
// Exemplo0031 - Exemplo0031.v
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s, output [3:0] s1, output [7:0] sFim,
                    input  [3:0] a, 
                    input  [3:0] b); 
 
// descrever por portas 

assign s = a | b ;
assign s1 = a&b;
assign sFim[3:0] = s;
assign sFim[7:4] = s1;
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y; 
       wire [3:0] z;
		 wire [3:0] z1;
		 wire [7:0] zFim;
 
       f4 modulo ( z, z1, zFim, x, y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0031 - Felipe Ferreira Andrade do Carmo - 427402"); 
      $display("Test LU's module"); 
 
      x = 4'b0011;       y = 4'b0101; 
 
   // projetar testes do modulo 
	$display("\n  a \t  b \t  a&b-a|b");
   #1 $display("%3b    %3b     %3b",x,y,zFim);

 
   end 
 
endmodule // test_f4 