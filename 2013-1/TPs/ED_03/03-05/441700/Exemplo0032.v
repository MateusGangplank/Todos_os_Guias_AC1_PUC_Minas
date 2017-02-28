// ------------------------- 
// Exemplo0032 - AND-OR 
// Nome: Mateus Lara Carvalho
// Matricula: 441700 
// ------------------------- 
// -------------------------
	module LU (output sOR, output sAND, input a, input b, input m);
	wire notM,andAB,orAB;
	
	not NOT1 (notM, m);
	and AND1 (andAB, a, b);
	or  OR1  (orAB, a, b);
	and AND2 (sOR, orAB, notM);
	and AND3 (sAND, andAB, m);
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
		m = 0;
	end
	
// ------------------------- parte principal
   	initial begin
      $display("Exemplo0032 - Mateus Lara Carvalho - 441700");
      $display("Test LU's module");
		$display ("--- CHAVE = 0 ---");
      $monitor("a = %b b = %b sOR = %b",x,y,w); 
		x = 0; y = 0; m = 0;
		#1 
		x = 0; y = 1; m = 0;  
		#1 
		x = 1; y = 0; m = 0;
		#1
		x = 1; y = 1; m = 0;
		#1
		$display ("--- CHAVE = 1 ---");
		$monitor("a = %b b = %b sAND = %b",x,y,z);
		x = 0; y = 0; m = 1;
		#1
		x = 0; y = 1; m = 1;
		#1 
		x = 1; y = 0; m = 1;
		#1 
		x = 1; y = 1; m = 1;
  		end
endmodule // test_LU