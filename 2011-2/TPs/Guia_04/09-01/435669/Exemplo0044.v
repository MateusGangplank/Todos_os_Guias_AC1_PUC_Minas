// -------------------------
// Exemplo0041 � COMPARATOR2
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  Comparator
// ------------------------- 
module Comparator(output s,  
                       input  [5:0] x,  input  [5:0] y);
										 
	wire [5:0] w1;
	
// descrever por portas

 xnor xnor1 [5:0] (w1,x,y);
 // [0:0] = [0]
 nand nand1 (s,w1[0:0],w1[1:1],w1[2:2],w1[3:3],w1[4:4],w1[5:5]);

  
endmodule // fullComparator
 
module test_Comparator; 
// ------------------------- definir dados 

   reg  [5:0] x,y;
	wire [5:0] w1;
	
	Comparator modulo1 (s,x,y);
	
	initial begin
	
	x= 6'b000000;
	y= 6'b000000;	
	end
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test ALU�s full subtractor"); 
 
 // projetar testes do somador complete 
 
 $monitor("x=%6b  y=%6b s=%1b Equals", x,y,s);
 #1 x= 6'b111111; y= 6'b000000;
 $monitor("x=%6b  y=%6b s=%1b Different", x,y,s);
 
 end 
 
endmodule // test_Comparator
 