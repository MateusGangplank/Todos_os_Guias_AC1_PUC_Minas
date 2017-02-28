// ------------------------- 
// Exemplo0037
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
// ------------------------- 

module AU (output sME, output sMA, input a, input b, input ch);
			  
	wire notCH,notA,notB,and1,and2;
	
	not NOT1 (notCH, ch);
	not NOT2 (notA, a);
	not NOT3 (notB, b);
	and AND1 (and1, notA, b);
	and AND2 (and2, a, notB);
	and AND3 (sME, and1, notCH);
	and AND4 (sMA, and2, ch);
endmodule 

module test_AU;
// ------------------------- definir dados
   reg x;
	reg y;
	reg ch;
	wire w;
	wire z;
	
	AU modulo (w, z, x, y, ch);
	
	initial begin: start
		x = 0; 
		y = 0;
		ch= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0037 - Marcio Santana Correa - 345368");
      $display("Test LU's module");
		$display ("---------------- CHAVE = 0 --------------------");
		$monitor("a = %b b = %b sME = %b",x,y,w);
		#1
		x = 0; y = 1; ch = 0;
		#1
		x = 1; y = 0; ch = 0;
		#1
		x = 1; y = 1; ch = 0;
		#1
		$display ("---------------- CHAVE = 1 --------------------");
		$monitor("a = %b b = %b sMA = %b",x,y,z);
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
    Exemplo0037 - Marcio Santana Correa 345368
    Test LU's module
    ---------------- CHAVE = 0 --------------------
    a = 0 b = 0 sME = 0
    a = 0 b = 1 sME = 1
    a = 1 b = 0 sME = 0
    a = 1 b = 1 sME = 0
    ---------------- CHAVE = 1 --------------------
    a = 0 b = 0 sMA = 0
    a = 0 b = 1 sMA = 0
    a = 1 b = 0 sMA = 1
    a = 1 b = 1 sMA = 0
*/