// ------------------------- 
// Exemplo0031 - F4 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
module LU (output sOR, output sAND, input a, input b, input ch);
	wire notCH,andAB,orAB;
	
	not NOT1 (notCH, ch);
	and AND1 (andAB, a, b);
	or  OR1  (orAB, a, b);
	and AND2 (sOR, orAB, notCH);
	and AND3 (sAND, andAB, ch);
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
      $display("Exemplo0032 - Marcio Santana Correa - 345368");
      $display("Test LU's module");
		$display ("---------------- CHAVE = 0 --------------------");
      $monitor("a = %b b = %b sOR = %b",x,y,w); 
		#1 
		x = 0; y = 1; ch = 0;  
		#1 
		x = 1; y = 0; ch = 0;
		#1
		x = 1; y = 1; ch = 0;
		#1
		$display ("---------------- CHAVE = 1 --------------------");
		$monitor("a = %b b = %b sAND = %b",x,y,z);
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
    Exemplo0032 - Marcio Santana Correa 345368
    Test LU's module
    ---------------- CHAVE = 0 --------------------
    a = 0 b = 0 sOR = 0
    a = 0 b = 1 sOR = 1
    a = 1 b = 0 sOR = 1
    a = 1 b = 1 sOR = 1
    ---------------- CHAVE = 1 --------------------
    a = 0 b = 0 sAND = 0
    a = 0 b = 1 sAND = 0
    a = 1 b = 0 sAND = 0
    a = 1 b = 1 sAND = 1
*/