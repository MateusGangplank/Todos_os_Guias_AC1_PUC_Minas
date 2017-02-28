// -------------------------
// Exemplo0033 - F4
// Nome: Jenifer Henrique Moreira Borges.
// Matricula: 427420
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output s, input a, input b, input chave);

wire s_and1;
wire s_and2;
wire s_and3;
wire s_and4;
wire s_and5;
wire s_or1;
wire s_or2;
wire s_not1;
wire s_nand1;
wire s_nor1;

	and AND1(s_and1, a, b);
	and AND2(s_and2, s_nand1, s_not1);
	and AND3(s_and3, s_or1, s_not1);
	and AND4(s_and4, s_nor1, chave);
	and AND5(s_and5, s_nand1, chave);
	
	or OR1(s_or1, a, b);
	or OR20(s, s_and2, s_and3, s_and4, s_and5);
	
	nand NAND1(s_nand1, a, b);
	
	nor NOR1(s_nor1, a, b);
	
	not NOT1(s_not1, chave);					  

endmodule // f4

module test_f4;
// ------------------------- definir dados
 reg x; 
 reg y; 
 reg c;
 wire s; 
 
 f4 modulo (s, x, y, c);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Jenifer Henrique Moreira Borges - 427420.");
      $display("Test LU's module");
		
		
		#1 $monitor(" x: %2b \t y: %2b \t Resultado: %4b",x,y,s,c);
		#1 x = 2'b01; y = 2'b10; c = 0; 
	   #1 x = 2'b01; y = 2'b10; c = 1;  
	   #1 x = 2'b11; y = 2'b00; c = 0;
	   #1 x = 2'b11; y = 2'b00; c = 1; 
		#1 x = 2'b01; y = 2'b00; c = 0;
	   #1 x = 2'b01; y = 2'b00; c = 1; 
	   #1 x = 2'b10; y = 2'b10; c = 0;
	   #1 x = 2'b10; y = 2'b10; c = 1; 

end
endmodule // test_f4