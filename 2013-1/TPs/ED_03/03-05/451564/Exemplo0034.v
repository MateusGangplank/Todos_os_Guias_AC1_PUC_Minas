// -------------------------
// Exemplo0034 - F4
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module LU (output sON, output sXX, input a, input b, input c1, input c2);
	wire notC1,notC2,xorAB,xnorAB,orAB,norAB,and1,and2,and3,and4;
	
// ---------------------- portas not	
	
	not NOT1   (notC1, c1);
	not NOT2   (notC2, c2);
	
// ----------------------- porta xor	
	
	xor XOR1   (xorAB, a, b);
	
// ----------------------- porta xnor	
	
	xnor XNOR1 (xnorAB, a, b);

// ------------------------ porta nor

	nor NOR1   (norAB, a, b);
	
// ------------------------- portas and	
	
	and AND1   (and1, xorAB, c1, notC2);
	and AND2   (and2, xnorAB, c1, c2);
	and AND3   (and3, orAB, notC1, notC2);
	and AND4   (and4, norAB, notC1, c2);
	
// -------------------------- portas or	
	
	or  OR1    (orAB, a, b);
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
	
   initial begin
      $display("Exemplo0034 - Guilherme Augusto Bueno Borba - 451564");
      $display("Test LU's module");
		
		$display ("\nValor da Selecao = 00");
      $monitor("Entradas : a = %b b = %b Selecao: OR = %b",x,y,w); 
		#1 
		x = 0; y = 1; c1 = 0; c2 = 0;  
		#1 
		x = 1; y = 0; c1 = 0; c2 = 0;
		#1
		x = 1; y = 1; c1 = 0; c2 = 0;
		#1
		$display ("\nValor da Selecao = 01");
		$monitor("Entradas : a = %b b = %b Selecao: NOR = %b",x,y,w);
		x = 0; y = 0; c1 = 0; c2 = 1;
		#1
		x = 0; y = 1; c1 = 0; c2 = 1;
		#1 
		x = 1; y = 0; c1 = 0; c2 = 1;
		#1 
		x = 1; y = 1; c1 = 0; c2 = 1;
		#1
		$display ("\nValor da Selecao = 10");
		$monitor("Entradas : a = %b b = %b Selecao: XOR = %b",x,y,z);
		x = 0; y = 0; c1 = 1; c2 = 0;
		#1
		x = 0; y = 1; c1 = 1; c2 = 0;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 0;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 0;
		#1
		$display ("\nValor da Selecao = 11");
		$monitor("Entradas : a = %b b = %b Selecao: XNOR = %b",x,y,z);
		x = 0; y = 0; c1 = 1; c2 = 1;
		#1
		x = 0; y = 1; c1 = 1; c2 = 1;
		#1 
		x = 1; y = 0; c1 = 1; c2 = 1;
		#1 
		x = 1; y = 1; c1 = 1; c2 = 1;			
   end
endmodule // test_LU