// ------------------------- 
// Exemplo0036
// Nome: Mateus Lara Carvalho
// Matricula: 441700
// ------------------------- 

module AU (output sIG, output sDF, input a, input b, input ch);
			  
	wire notCH,xorAB,xnorAB;
	
	not NOT1   (notCH, ch);
	xor XOR1   (xorAB, a, b);
	xnor XNOR1 (xnorAB, a, b);
	and AND1   (sDF, xorAB, ch);
	and AND2   (sIG, xnorAB, notCH);
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
      $display("Exemplo0036 - Mateus Lara Carvalho - 441700");
      $display("Test LU's module");
		$display ("--- CHAVE = 0 ---");
		$monitor("a = %b b = %b sIG = %b",x,y,w);
		#1
		x = 0; y = 1; ch = 0;
		#1
		x = 1; y = 0; ch = 0;
		#1
		x = 1; y = 1; ch = 0;
		#1
		$display ("--- CHAVE = 1 ---");
		$monitor("a = %b b = %b sDIF = %b",x,y,z);
		x = 0; y = 0; ch = 1;
		#1
		x = 0; y = 1; ch = 1;
		#1 
		x = 1; y = 0; ch = 1;
		#1 
		x = 1; y = 1; ch = 1;						
   end
endmodule // test_LU

