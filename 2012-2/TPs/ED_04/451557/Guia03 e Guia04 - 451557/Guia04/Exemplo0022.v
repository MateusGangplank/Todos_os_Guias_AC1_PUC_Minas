// -------------------------
// Exemplo0021 – FULL SUBTRACTOR
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// ------------------------- 
// -------------------------
// -------------------------
//  full subtractor
// -------------------------
module fullSubtractor (output s1, output s2, input  a, input  b, input c);
	wire not1,xor1,xor2,and1,and2;
	
	not NOT1 (not1, a);
	xor XOR1 (xor2, b, c);
	and AND1 (and1, xor2, not1);
	and AND2 (and2, b, c);
	xor XOR2 (xor1, a, b);
	or  OR1  (s2, and1, and2);
	xor XOR3 (s1, xor1, c);
endmodule // fullSubtractor

module test_fullSubtractor;
// ------------------------- definir dados
   reg x;
	reg y;
	reg c;
	wire s1;
	wire s2;
	
	fullSubtractor modulo (s1, s2, x, y, c);
	
	initial begin: start
		x = 0; 
		y = 0;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0022 - Gabriel Carlos Damasceno Arriel - 451557");
      $display("Test ALU's full subtractor");
      $monitor("%b(a) - %b(b) - %b(c) = %b(s2)  %b(s1)",x,y,c,s2,s1); 
		#1 x = 0; y = 0; c = 1;  
		#1 x = 0; y = 1; c = 0;
		#1 x = 0; y = 1; c = 1;
		#1 x = 1; y = 0; c = 0;
		#1 x = 1; y = 0; c = 1;
		#1 x = 1; y = 1; c = 0;
		#1 x = 1; y = 1; c = 1;
   end
endmodule // test_Subtractor
