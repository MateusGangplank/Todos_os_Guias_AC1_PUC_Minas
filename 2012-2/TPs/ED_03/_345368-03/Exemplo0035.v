// ------------------------- 
// Exemplo0035 - 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
module LU (output sNOT, output sON, output sAN, output sXX, 
			  input a, input b, input c1, input c2, input c3);
			  
	wire notC1,notC2,notC3,notA,notB,orAB,norAB,andAB,nandAB,
		  xorAB,xnorAB,and1,and2,and3,and4,and5,and6,and7,and8;
	
	not NOT1   (notC1, c1);
	not NOT2   (notC2, c2);
	not NOT3   (notC3, c3);
	not NOT4   (notA, a);
	not NOT5   (notB, b);
	or  OR1    (orAB, a, b);
	nor NOR1   (norAB, a, b);
	and AND1   (andAB, a, b);
	nand NAND1 (nandAB, a, b);
	xor XOR1   (xorAB, a, b);
	xnor XNOR1 (xnorAB, a, b);
	and AND2   (and1, notA, notC1, notC2, notC3);
	and AND3   (and2, notB, notC1, notC2, c3);
	and AND4   (and3, orAB, notC1, c2, notC3);
	and AND5   (and4, norAB, notC1, c2, c3);
	and AND6   (and5, andAB, c1, notC2, notC3);
	and AND7   (and6, nandAB, c1, notC2, c3);
	and AND8   (and7, xorAB, c1, c2, notC3);
	and AND9   (and8, xnorAB, c1, c2, c3);
	or OR2     (sNOT, and1, and2);
	or OR3     (sON, and3, and4);
	or OR4     (sAN, and5, and6);
	or OR5     (sXX, and7, and8);
endmodule 

module test_LU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c1;
	reg c2;
	reg c3;
	wire m;
	wire n;
	wire o;
	wire p;
	
	LU modulo (m, n, o, p, x, y, c1, c2, c3);
	
	initial begin: start
		x = 0; 
		y = 0;
		c1= 0;
		c2= 0;
		c3= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0035 - Marcio Santana Correa	- 345368");
      $display("Test LU's module");
		$display ("---------------- CHAVE = 000 --------------------");
      $monitor("a = %b sNOTA = %b",x,m);  
		#1 
		x = 1; c1 = 0; c2 = 0; c3 = 0; 
		#1
		$display ("---------------- CHAVE = 001 --------------------");
		$monitor("b = %b sNOTB = %b",y,m);
		y = 0; c1 = 0; c2 = 0; c3 = 1;
		#1
		y = 1; c1 = 0; c2 = 0; c3 = 1;
		#1
		$display ("---------------- CHAVE = 010 --------------------");
		$monitor("a = %b b = %b sOR = %b",x,y,n);
		x = 0; y = 0; c1 = 0; c2 = 1; c3 = 0;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1; c3 = 0;
		#1
		$display ("---------------- CHAVE = 011 --------------------");
		$monitor("a = %b b = %b sNOR = %b",x,y,n);
		x = 0; y = 0; c1 = 0; c2 = 1; c3 = 1;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1; c3 = 1;		
		#1
		$display ("---------------- CHAVE = 100 --------------------");
		$monitor("a = %b b = %b sAND = %b",x,y,o);
		x = 0; y = 0; c1 = 1; c2 = 0; c3 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0; c3 = 0;		
		#1
		$display ("---------------- CHAVE = 101 --------------------");
		$monitor("a = %b b = %b sNAND = %b",x,y,o);
		x = 0; y = 0; c1 = 1; c2 = 0; c3 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0; c3 = 1;		
		#1
		$display ("---------------- CHAVE = 110 --------------------");
		$monitor("a = %b b = %b sXOR = %b",x,y,p);
		x = 0; y = 0; c1 = 1; c2 = 1; c3 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1; c3 = 0;
		#1
		$display ("---------------- CHAVE = 111 --------------------");
		$monitor("a = %b b = %b sXNOR = %b",x,y,p);
		x = 0; y = 0; c1 = 1; c2 = 1; c3 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1; c3 = 1;						
   end
endmodule // test_LU

/*
    Exemplo0035 - Marcio Santana Correa 345368
    Test LU's module
    ---------------- CHAVE = 000 --------------------
    a = 0 sNOTA = 1
    a = 1 sNOTA = 0
    ---------------- CHAVE = 001 --------------------
    b = 0 sNOTB = 1
    b = 1 sNOTB = 0
    ---------------- CHAVE = 010 --------------------
    a = 0 b = 0 sOR = 0
    a = 0 b = 1 sOR = 1
    a = 1 b = 0 sOR = 1
    a = 1 b = 1 sOR = 1
    ---------------- CHAVE = 011 --------------------
    a = 0 b = 0 sNOR = 1
    a = 0 b = 1 sNOR = 0
    a = 1 b = 0 sNOR = 0
    a = 1 b = 1 sNOR = 0
    ---------------- CHAVE = 100 --------------------
    a = 0 b = 0 sAND = 0
    a = 0 b = 1 sAND = 0
    a = 1 b = 0 sAND = 0
    a = 1 b = 1 sAND = 1
    ---------------- CHAVE = 101 --------------------
    a = 0 b = 0 sNAND = 1
    a = 0 b = 1 sNAND = 1
    a = 1 b = 0 sNAND = 1
    a = 1 b = 1 sNAND = 0
    ---------------- CHAVE = 110 --------------------
    a = 0 b = 0 sXOR = 0
    a = 0 b = 1 sXOR = 1
    a = 1 b = 0 sXOR = 1
    a = 1 b = 1 sXOR = 0
    ---------------- CHAVE = 111 --------------------
    a = 0 b = 0 sXNOR = 1
    a = 0 b = 1 sXNOR = 0
    a = 1 b = 0 sXNOR = 0
    a = 1 b = 1 sXNOR = 1
*/