// ------------------------- 
// Exemplo0024 - COMPARADOR
// Nome: Marcio Santana Correa  
// Matricula: 345368
// ------------------------- 

// -------------------------
//  comparador
// -------------------------
module Comparador (output s, input  a, input  b, input c);
	wire notA,notC,and1,and2,xorAB;
	
	not NOT1 (notA, a);
	not NOT3 (notC, c);
	xor XOR1 (xorAB, a, b);
	and AND1 (and1, notA, c);
	and AND2 (and2, b, notC);
	or  OR1  (s, xorAB, and1, and2);
endmodule // Comparador

module test_Comparador;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s;
	
	Comparador diferenca (s, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0024 - Marcio Santana Correa -  345368");
      $display("Test ALU's comparador");
		$display("a b c = s");
      $monitor("%b %b %b = %b",x,y,c,s); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_Comparador
/*
    Exemplo0024 - Marcio Santana Correa -  345368
	     Test ALU's comparador
    a b c = s
    0 0 0 = 0
    0 0 1 = 1
    0 1 0 = 1
    0 1 1 = 1
    1 0 0 = 1
    1 0 1 = 1
    1 1 0 = 1
    1 1 1 = 0
*/