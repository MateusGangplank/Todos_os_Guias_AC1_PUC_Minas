// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// ------------------------- 
// -------------------------
//  full adder
// -------------------------
   module fullAdder (output s1, output s2, input  a, input  b, input c);
	wire xor1, and1, and2, and3;
	xor XOR1 (xor1, a, b);
	and AND1 (and1, b, c);
	and AND2 (and2, a, c);
	and AND3 (and3, a, b);
	xor XOR2 (s2, xor1, c);
	or  OR1  (s1, and1, and2, and3);
endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s1;
	wire s2;
	
	fullAdder modulo (s1, s2, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0021 - Gabriel Carlos Damasceno Arriel - 451557");
      $display("Test ALU's full adder");
      $monitor("%b(a) + %b(b) + %b(c) = %b(s1)  %b(s2)",x,y,c,s1,s2); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_fullAdder