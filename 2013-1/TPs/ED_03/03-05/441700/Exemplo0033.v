// ------------------------- 
// Exemplo0033 - ANDOR-NANDNOR 
// Nome: Mateus Lara Carvalho
// Matricula: 441700 
// ------------------------- 
// -------------------------
	module LU (output sAO, output sNN, input a, input b, input m);
	wire notM,andAB,orAB,nandAB,norAB,and1,and2,and3,and4;
	
	not NOT1   (notM, m);
	and AND1   (andAB, a, b);
	or  OR1    (orAB, a, b);
	nand NAND1 (nandAB, a, b);
	nor NOR1   (norAB, a, b);
	and AND2   (and1, andAB, notM);
	and AND3   (and2, orAB, notM);
	and AND4   (and3, nandAB, m);
	and AND5   (and4, norAB, m);
	or OR2     (sAO, and1, and2);
	or OR3     (sNN, and3, and4);
endmodule 

module test_LU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg m;
	wire w;
	wire z;
	
	LU modulo (w, z, x, y, m);
	
	initial begin: start
		x = 0; 
		y = 0;
		m= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Mateus Lara Carvalho - 441700");
      $display("Test LU's module");
		$display ("--- CHAVE = 0 ---");
      $monitor("a = %b b = %b sAND-OR = %b",x,y,w); 
		x = 0; y = 0; m = 0;  
		#1 
		x = 0; y = 1; m = 0;  
		#1 
		x = 1; y = 0; m = 0;
		#1
		x = 1; y = 1; m = 0;
		#1
		$display ("--- CHAVE = 1 ---");
		$monitor("a = %b b = %b sNAND-NOR = %b",x,y,z);
		x = 0; y = 0; m = 1;
		#1
		x = 0; y = 1; m = 1;
		#1 
		x = 1; y = 0; m = 1;
		#1 
		x = 1; y = 1; m = 1;
   end
endmodule // test_LU