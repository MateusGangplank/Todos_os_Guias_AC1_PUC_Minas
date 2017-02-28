// ------------------------- 
// Exemplo0023 - COMPARADOR
// Nome: Marcio Santana Correa -  
// Matricula: 382175
// ------------------------- 

// -------------------------
//  comparador
// -------------------------
module Comparador (output s, input  a, input  b, input c);
	wire notA,notB,notC,and1,and2;
	
	not NOT1 (notA, a);
	not NOT2 (notB, b);
	not NOT3 (notC, c);
	and AND1 (and1, notA, notB, notC);
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
      $display("Exemplo0023 - Marcio Santana Correa -  345368");
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
    Exemplo0023 - Marcio Santana Correa -  345368
    Test ALU's comparador
    a b c = s
    0 0 0 = 1
    0 0 1 = 0
    0 1 0 = 0
    0 1 1 = 0
    1 0 0 = 0
    1 0 1 = 0
    1 1 0 = 0
    1 1 1 = 1
*/