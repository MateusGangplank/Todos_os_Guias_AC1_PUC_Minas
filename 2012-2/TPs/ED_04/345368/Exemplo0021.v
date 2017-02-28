// ------------------------- 
// Exemplo0041 - FULL ADDER
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 

// -------------------------
//  full adder
// -------------------------
module fullAdder (output s1, output s0, input  a, input  b, input c);
	wire xorAB, and1, and2, and3;
	
	xor XOR1 (xorAB, a, b);
	and AND1 (and1, b, c);
	and AND2 (and2, a, c);
	and AND3 (and3, a, b);
	xor XOR2 (s0, xorAB, c);
	or  OR1  (s1, and1, and2, and3);
endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s1;
	wire s0;
	
	fullAdder modulo (s1, s0, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0021 - Marcio Santana Correa - 345368");
      $display("Test ALU's full adder");
		$display("a + b + c = s1 s0");
      $monitor("%b + %b + %b = %b  %b",x,y,c,s1,s0); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_fullAdder

/*
    Exemplo0021 - Marcio Santana Correa -  345368
	     Test ALU's full adder
    a + b + c = s1 s0
    0 + 0 + 0 = 0  0
    0 + 0 + 1 = 0  1
    0 + 1 + 0 = 0  1
    0 + 1 + 1 = 1  0
    1 + 0 + 0 = 0  1
    1 + 0 + 1 = 1  0
    1 + 1 + 0 = 1  0
    1 + 1 + 1 = 1  1
*/