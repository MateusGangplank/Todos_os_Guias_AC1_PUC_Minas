// -------------------------
// Exemplo0031 - F4
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module LU (output sNOT, output sON, output sAN, output sXX, 
			  input a, input b, input c1, input c2, input c3);
			  
	wire notC1,notC2,notC3,notA,notB,orAB,norAB,andAB,nandAB,
		  xorAB,xnorAB,and1,and2,and3,and4,and5,and6,and7,and8;
		  
// -------------------- portas not

	not NOT1   (notC1, c1);
	not NOT2   (notC2, c2);
	not NOT3   (notC3, c3);
	not NOT4   (notA, a);
	not NOT5   (notB, b);

// ------------------- porta nor

	nor NOR1   (norAB, a, b);
	
// -------------------- porta nand	

	nand NAND1 (nandAB, a, b);

// --------------------- porta xor

	xor XOR1   (xorAB, a, b);

// ---------------------- porta xnor

	xnor XNOR1 (xnorAB, a, b);
	
// ---------------------- portas ends

	and AND1   (andAB, a, b);
	and AND2   (and1, notA, notC1, notC2, notC3);
	and AND3   (and2, notB, notC1, notC2, c3);
	and AND4   (and3, orAB, notC1, c2, notC3);
	and AND5   (and4, norAB, notC1, c2, c3);
	and AND6   (and5, andAB, c1, notC2, notC3);
	and AND7   (and6, nandAB, c1, notC2, c3);
	and AND8   (and7, xorAB, c1, c2, notC3);
	and AND9   (and8, xnorAB, c1, c2, c3);
	
// ------------------------------ portas or

	or OR1    (orAB, a, b);
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
      $display("Exemplo0035 - Eduardo de Figueiredo Junior - 451550");
      $display("Test LU's module");
		$display ("\nValor da Selecao = 000");
      $monitor("a = %b NOT A = %b",x,m);  
		#1 
		x = 1; c1 = 0; c2 = 0; c3 = 0; 
		#1
		$display ("\nValor da Selecao = 001");
		$monitor("b = %b NOT B = %b",y,m);
		y = 0; c1 = 0; c2 = 0; c3 = 1;
		#1
		y = 1; c1 = 0; c2 = 0; c3 = 1;
		#1
		$display ("\nValor da Selecao = 010");
		$monitor("Entradas : a = %b b = %b Selecao: OR = %b",x,y,n);
		x = 0; y = 0; c1 = 0; c2 = 1; c3 = 0;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1; c3 = 0;
		#1
		$display ("\nValor da Selecao = 011");
		$monitor("Entradas : a = %b b = %b Selecao: NOR = %b",x,y,n);
		x = 0; y = 0; c1 = 0; c2 = 1; c3 = 1;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1; c3 = 1;		
		#1
		$display ("\nValor da Selecao = 100");
		$monitor("Entradas : a = %b b = %b Selecao: AND = %b",x,y,o);
		x = 0; y = 0; c1 = 1; c2 = 0; c3 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0; c3 = 0;		
		#1
		$display ("\nValor da Selecao = 101");
		$monitor("Entradas : a = %b b = %b Selecao: NAND = %b",x,y,o);
		x = 0; y = 0; c1 = 1; c2 = 0; c3 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0; c3 = 1;		
		#1
		$display ("\nValor da Selecao = 110");
		$monitor("Entradas : a = %b b = %b Selecao: XOR = %b",x,y,p);
		x = 0; y = 0; c1 = 1; c2 = 1; c3 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1; c3 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1; c3 = 0;
		#1
		$display ("\nValor da Selecao = 111");
		$monitor("Entradas : a = %b b = %b Selecao: XNOR = %b",x,y,p);
		x = 0; y = 0; c1 = 1; c2 = 1; c3 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1; c3 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1; c3 = 1;						
   end
endmodule // test_LU
