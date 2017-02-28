// ------------------------- 
// Exemplo0034
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

module LU (output sON, output sXX, input a, input b, input c1, input c2);
	wire notC1,notC2,xorAB,xnorAB,orAB,norAB,and1,and2,and3,and4;
	
	not NOT1   (notC1, c1);
	not NOT2   (notC2, c2);
	xor XOR1   (xorAB, a, b);
	xnor XNOR1 (xnorAB, a, b);
	or  OR1    (orAB, a, b);
	nor NOR1   (norAB, a, b);
	and AND1   (and1, xorAB, c1, notC2);
	and AND2   (and2, xnorAB, c1, c2);
	and AND3   (and3, orAB, notC1, notC2);
	and AND4   (and4, norAB, notC1, c2);
	or OR2     (sXX, and1, and2);
	or OR3     (sON, and3, and4);
endmodule 

module test_LU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c1;
	reg c2;
	wire w;
	wire z;
	
	LU modulo (w, z, x, y, c1, c2);
	
	initial begin: start
		x = 0; 
		y = 0;
		c1= 0;
		c2= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0034 - Oswaldo Oliveira Paulino - 382175");
      $display("Test LU's module");
		$display ("---------------- CHAVE = 00 --------------------");
      $monitor("a = %b b = %b sOR = %b",x,y,w); 
		#1 
		x = 0; y = 1; c1 = 0; c2 = 0;  
		#1 
		x = 1; y = 0; c1 = 0; c2 = 0;
		#1
		x = 1; y = 1; c1 = 0; c2 = 0;
		#1
		$display ("---------------- CHAVE = 01 --------------------");
		$monitor("a = %b b = %b sNOR = %b",x,y,w);
		x = 0; y = 0; c1 = 0; c2 = 1;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1;
		#1
		$display ("---------------- CHAVE = 10 --------------------");
		$monitor("a = %b b = %b sXOR = %b",x,y,z);
		x = 0; y = 0; c1 = 1; c2 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0;
		#1
		$display ("---------------- CHAVE = 11 --------------------");
		$monitor("a = %b b = %b sXNOR = %b",x,y,z);
		x = 0; y = 0; c1 = 1; c2 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1;			
   end
endmodule // test_LU

/*
    Exemplo0034 - Oswaldo Oliveira Paulino - 382175
    Test LU's module
    ---------------- CHAVE = 00 --------------------
    a = 0 b = 0 sOR = 0
    a = 0 b = 1 sOR = 1
    a = 1 b = 0 sOR = 1
    a = 1 b = 1 sOR = 1
    ---------------- CHAVE = 01 --------------------
    a = 0 b = 0 sNOR = 1
    a = 0 b = 1 sNOR = 0
    a = 1 b = 0 sNOR = 0
    a = 1 b = 1 sNOR = 0
    ---------------- CHAVE = 10 --------------------
    a = 0 b = 0 sXOR = 0
    a = 0 b = 1 sXOR = 1
    a = 1 b = 0 sXOR = 1
    a = 1 b = 1 sXOR = 0
    ---------------- CHAVE = 11 --------------------
    a = 0 b = 0 sXNOR = 1
    a = 0 b = 1 sXNOR = 0
    a = 1 b = 0 sXNOR = 0
    a = 1 b = 1 sXNOR = 1
*/