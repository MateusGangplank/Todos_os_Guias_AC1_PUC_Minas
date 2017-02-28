// ------------------------- 
// Exemplo0031 - F4 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s,output [3:0] s1, input  [3:0] a, input  [3:0] b); 
 
// descrever por portas 
 
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y; 
       wire [3:0] z;
		 wire [3:0] w; 
		 
		 assign z= (x & y);
		 assign w= (x | y);
 
       f4 modulo (z, w, x, y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0031 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test LU's module"); 
 
      x = 4'b0011;       y = 4'b0101; 
 
   // projetar testes do modulo 
   #1 $display("and = %3b e %3b = %3b",x,y,z);
	#1 $display("or = %3b e %3b = %3b",x,y,w);  
 
   end 
 
endmodule // test_f4 