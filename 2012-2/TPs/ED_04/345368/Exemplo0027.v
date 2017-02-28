
// ------------------------- 
// Exemplo0024 - COMPARADOR SELECIONAVEL
// Nome: Marcio Santana Correa -  345368
// Matricula: 382175
// ------------------------- 

// -------------------------
//  comparador
// -------------------------

module comparadorIgu (output s, input  a, input  b, input c);
	wire notA,notB,notC,and1,and2;
	
	not NOT1 (notA, a);
	not NOT2 (notB, b);
	not NOT3 (notC, c);
	and AND1 (and1, notA, notB, notC);
	and AND2 (and2, a, b, c);
	or  OR1  (s, and1, and2);
endmodule // comparadorIgu

module comparadorDif (output s, input  a, input  b, input c);
	wire notA,notC,and1,and2,xorAB;
	
	not NOT1 (notA, a);
	not NOT3 (notC, c);
	xor XOR1 (xorAB, a, b);
	and AND1 (and1, notA, c);
	and AND2 (and2, b, notC);
	or  OR1  (s, xorAB, and1, and2);
endmodule // comparadorDif

module comparadorSel (output sI, output sD, input  a, input  b, input c, input ch);
	wire notCH,x,y;
	
	not NOT1                (notCH, ch);
	comparadorIgu igual     (x, a, b, c);
	comparadorDif diferente (y, a, b, c);
	and AND1                (sI, x, notCH);
	and AND2                (sD, y, ch);
endmodule // comparadorSel

module test_comparadorSel;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	reg ch;
	wire w;
	wire z;
	
	comparadorSel selecionavel (w, z, x, y, c, ch);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
		ch= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0027 - Marcio Santana Correa -  345368");
      $display("Test ALU's comparador");
		$display("------------ CHAVE = 0 ------------");
		$display("a b c = s");
      $monitor("%b %b %b = %b",x,y,c,w); 
		#1 x = 0; y = 0; c = 1; ch = 0; 
		#1 x = 0; y = 1; c = 0; ch = 0; 
		#1 x = 0; y = 1; c = 1; ch = 0; 
		#1 x = 1; y = 0; c = 0; ch = 0; 
		#1 x = 1; y = 0; c = 1; ch = 0; 
		#1 x = 1; y = 1; c = 0; ch = 0; 
		#1 x = 1; y = 1; c = 1; ch = 0; 
	   #1 x = 0; y = 0; c = 0; ch = 1;
		
	   $display("------------ CHAVE = 1 ------------");
	   $display("a b c = s");
      $monitor("%b %b %b = %b",x,y,c,z); 
	   #1 x = 0; y = 0; c = 1; ch = 1; 
	   #1 x = 0; y = 1; c = 0; ch = 1; 
	   #1 x = 0; y = 1; c = 1; ch = 1; 
	   #1 x = 1; y = 0; c = 0; ch = 1; 
	   #1 x = 1; y = 0; c = 1; ch = 1; 
	   #1 x = 1; y = 1; c = 0; ch = 1; 
	   #1 x = 1; y = 1; c = 1; ch = 1;		
   end
endmodule // test_comparadorSel
/*
    Exemplo0027 - Marcio Santana Correa -  345368
    Test ALU's comparador
    ------------ CHAVE = 0 ------------
    a b c = s
    0 0 0 = 1
    0 0 1 = 0
    0 1 0 = 0
    0 1 1 = 0
    1 0 0 = 0
    1 0 1 = 0
    1 1 0 = 0
    1 1 1 = 1
    ------------ CHAVE = 1 ------------
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