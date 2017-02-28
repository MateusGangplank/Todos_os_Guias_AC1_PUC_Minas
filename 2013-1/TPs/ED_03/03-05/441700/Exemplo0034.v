// ------------------------- 
// Exemplo0034
// Nome: Mateus Lara Carvalho
// Matricula: 441700
// ------------------------- 

module LU (output sON, output sXX, input a, input b, input m1, input m2);
	wire notM1,notM2,xorAB,xnorAB,orAB,norAB,and1,and2,and3,and4;
	
	not NOT1   (notM1, m1);
	not NOT2   (notM2, m2);
	xor XOR1   (xorAB, a, b);
	xnor XNOR1 (xnorAB, a, b);
	or  OR1    (orAB, a, b);
	nor NOR1   (norAB, a, b);
	and AND1   (and1, xorAB, m1, notM2);
	and AND2   (and2, xnorAB, m1, m2);
	and AND3   (and3, orAB, notM1, notM2);
	and AND4   (and4, norAB, notM1, m2);
	or OR2     (sXX, and1, and2);
	or OR3     (sON, and3, and4);
endmodule 

module test_LU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg m1;
	reg m2;
	wire w;
	wire z;
	
	LU modulo (w, z, x, y, m1, m2);
	
	initial begin: start
		x = 0; 
		y = 0;
		m1= 0;
		m2= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0034 - Mateus Lara Carvalho - 441700");
      $display("Test LU's module");
		$display ("--- CHAVE = 00 ---");
      $monitor("a = %b b = %b sOR = %b",x,y,w); 
		x = 0; y = 0; m1 = 0; m2 = 0;  
		#1 
		x = 0; y = 1; m1 = 0; m2 = 0;  
		#1 
		x = 1; y = 0; m1 = 0; m2 = 0;
		#1
		x = 1; y = 1; m1 = 0; m2 = 0;
		#1
		$display ("--- CHAVE = 01 ---");
		$monitor("a = %b b = %b sNOR = %b",x,y,w);
		x = 0; y = 0; m1 = 0; m2 = 1;
		#1
		x = 0; y = 1; m1 = 0; m2 = 1;
		#1 
		x = 1; y = 0; m1 = 0; m2 = 1;
		#1 
		x = 1; y = 1; m1 = 0; m2 = 1;
		#1
		$display ("--- CHAVE = 10 ---");
		$monitor("a = %b b = %b sXOR = %b",x,y,z);
		x = 0; y = 0; m1 = 1; m2 = 0;
		#1
		x = 0; y = 1; m1 = 1; m2 = 0;
		#1 
		x = 1; y = 0; m1 = 1; m2 = 0;
		#1 
		x = 1; y = 1; m1 = 1; m2 = 0;
		#1
		$display ("--- CHAVE = 11 ---");
		$monitor("a = %b b = %b sXNOR = %b",x,y,z);
		x = 0; y = 0; m1 = 1; m2 = 1;
		#1
		x = 0; y = 1; m1 = 1; m2 = 1;
		#1 
		x = 1; y = 0; m1 = 1; m2 = 1;
		#1 
		x = 1; y = 1; m1 = 1; m2 = 1;			
   end
endmodule // test_LU