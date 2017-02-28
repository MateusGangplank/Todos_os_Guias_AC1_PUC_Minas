// ------------------------- 
// Exemplo0024 - DIFERENCA
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// ------------------------- 
// -------------------------
// diferenca
// -------------------------
module Diferenca (output s, input  a, input  b, input c);
	wire not1,not2,and1,and2,xor1;
	
	not NOT1 (not1, a);
	not NOT3 (not2, c);
	xor XOR1 (xor1, a, b);
	and AND1 (and1, not1, c);
	and AND2 (and2, b, not2);
	or  OR1  (s, xor1, and1, and2);
endmodule // Diferenca

module test_Diferenca;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s;
	
 Diferenca diferenca (s, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0024 - Gabriel Carlos Damasceno Arriel - 451557");
      $display("Test ALU's diferenca");
      $monitor("%b(a) %b(b) %b(c) = %b(s)",x,y,c,s); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_Diferenca