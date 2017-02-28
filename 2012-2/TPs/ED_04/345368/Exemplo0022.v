// ------------------------- 
// Exemplo0022 - FULL SUBTRACTOR
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 

// -------------------------
//  full subtractor
// -------------------------
module fullSubtractor (output s1, output s0, input  a, input  b, input c);
	wire notA,xorAB,xorBC,and1,and2;
	
	not NOT1 (notA, a);
	xor XOR1 (xorBC, b, c);
	and AND1 (and1, xorBC, notA);
	and AND2 (and2, b, c);
	xor XOR2 (xorAB, a, b);
	or  OR1  (s0, and1, and2);
	xor XOR3 (s1, xorAB, c);
endmodule // fullSubtractor

module test_fullSubtractor;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s1;
	wire s0;
	
	fullSubtractor modulo (s1, s0, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0022 - Marcio Santana Correa -  345368");
      $display("Test ALU's full subtractor");
		$display("a - b - c = s0 s1");
      $monitor("%b - %b - %b = %b  %b",x,y,c,s0,s1); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_Subtractor

/*
    Exemplo0022 - Marcio Santana Correa -  345368
    Test ALU's full subtractor
    a - b - c = s0 s1
    0 - 0 - 0 = 0  0
    0 - 0 - 1 = 1  1
    0 - 1 - 0 = 1  1
    0 - 1 - 1 = 1  0
    1 - 0 - 0 = 0  1
    1 - 0 - 1 = 0  0
    1 - 1 - 0 = 0  0
    1 - 1 - 1 = 1  1
*/