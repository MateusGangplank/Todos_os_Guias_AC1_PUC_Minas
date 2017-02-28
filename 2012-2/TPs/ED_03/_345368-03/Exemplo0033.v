// ------------------------- 
// Exemplo0031 - F4 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
module LU (output sAO, output sNN, input a, input b, input ch);
	wire notCH,andAB,orAB,nandAB,norAB,and1,and2,and3,and4;
	
	not NOT1   (notCH, ch);
	and AND1   (andAB, a, b);
	or  OR1    (orAB, a, b);
	nand NAND1 (nandAB, a, b);
	nor NOR1   (norAB, a, b);
	and AND2   (and1, andAB, notCH);
	and AND3   (and2, orAB, notCH);
	and AND4   (and3, nandAB, ch);
	and AND5   (and4, norAB, ch);
	or OR2     (sAO, and1, and2);
	or OR3     (sNN, and3, and4);
endmodule 

module test_LU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg ch;
	wire w;
	wire z;
	
	LU modulo (w, z, x, y, ch);
	
	initial begin: start
		x = 0; 
		y = 0;
		ch= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Marcio Santana Correa - 345368");
      $display("Test LU's module");
		$display ("---------------- CHAVE = 0 --------------------");
      $monitor("a = %b b = %b sANDOR = %b",x,y,w); 
		#1 
		x = 0; y = 1; ch = 0;  
		#1 
		x = 1; y = 0; ch = 0;
		#1
		x = 1; y = 1; ch = 0;
		#1
		$display ("---------------- CHAVE = 1 --------------------");
		$monitor("a = %b b = %b sNANDNOR = %b",x,y,z);
		x = 0; y = 0; ch = 1;
		#1
		x = 0; y = 1; ch = 1;
		#1 
		x = 1; y = 0; ch = 1;
		#1 
		x = 1; y = 1; ch = 1;
   end
endmodule // test_LU

/*
    Exemplo0033 - Marcio Santana Correa 345368
    Test LU's module
    ---------------- CHAVE = 0 --------------------
    a = 0 b = 0 sANDOR = 0
    a = 0 b = 1 sANDOR = 1
    a = 1 b = 0 sANDOR = 1
    a = 1 b = 1 sANDOR = 1
    ---------------- CHAVE = 1 --------------------
    a = 0 b = 0 sNANDNOR = 1
    a = 0 b = 1 sNANDNOR = 1
    a = 1 b = 0 sNANDNOR = 1
    a = 1 b = 1 sNANDNOR = 0
*/