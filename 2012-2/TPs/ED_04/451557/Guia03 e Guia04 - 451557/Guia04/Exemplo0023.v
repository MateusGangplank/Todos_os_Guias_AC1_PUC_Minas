// ------------------------- 
// Exemplo0023 - COMPARADOR
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// ------------------------- 
// -------------------------
//  comparador
// -------------------------
module Comparador (output s, input  a, input  b, input c);
	wire not1,not2,not3,and1,and2;
	
	not NOT1 (not1, a);
	not NOT2 (not2, b);
	not NOT3 (not3, c);
	and AND1 (and1, not1, not2, not3);
	and AND2 (and2, a, b, c);
	or  OR1  (s, and1, and2);
endmodule // Comparador

module test_Comparador;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s;
	
	Comparador igualdade (s, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0023 - Gabriel Carlos Damasceno Arriel - 451557");
      $display("Test ALU's comparador");
      $monitor("%b(a) %b(b) %b(c) = %b(s)",x,y,c,s); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_Comparador
