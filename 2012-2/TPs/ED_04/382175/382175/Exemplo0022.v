// ------------------------- 
// Exemplo0022 - FULL SUBTRACTOR
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  full subtractor
// -------------------------

module halfAdder1 (output s1, output s0, input a);
	xor (s0, a, 1);
	and (s1, a, 1);
endmodule // halfAdder1

module halfAdder2 (output s1, output s0, input a, input b);
	xor (s0, a, b);
	and (s1, a, b);
endmodule // halfAdder2

module Complemento (output c_out, output s2, output s1, output s0, input [2:0] a);
	wire notA0,notA1,notA2,x,y;
	
	not NOT1 (notA0, a[0]);
	not NOT2 (notA1, a[1]);
	not NOT3 (notA2, a[2]);
	halfAdder1 HA1  (x, s0, notA0);
	halfAdder2 HA2A (y, s1, notA1, x);
	halfAdder2 HA2B (c_out, s2, notA2, y);
endmodule // Complemento

module fullAdder (output carryOut, output s, input a, input b, input carryIn);
	wire h0,h1,h2;
	
	halfAdder2 HA2A (h0, h1, a, b);
	halfAdder2 HA2B (h2, s, h0, carryIn);
	or              (carryOut, h1, h2);
endmodule // fullAdder

module fullSubtractor (output s3, output s2, output s1, output s0, input  [2:0]a, input  [2:0]b);
	wire cout1, cout2, cout3, x, y, z;
	
	Complemento C2 (cout1, x, y, z, b);
	fullAdder FA1  (cout2, s0, a[0], z, cout1);
	fullAdder FA2  (cout3, s1, a[1], y, cout2);
	fullAdder FA3  (s3, s2, a[2], x, cout3);
endmodule // fullSubtractor

module test_fullSubtractor;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	wire s3;
	wire s2;
	wire s1;
	wire s0;
	
	fullSubtractor modulo (s3, s2, s1, s0, x, y);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0022 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's full subtractor");
		$display(" a  -  b  =  s");
      $monitor("%b - %b = %b%b%b%b",x,y,s3,s2,s1,s0); 
		#1 x = 3'b000; y = 3'b001; 
		#1 x = 3'b000; y = 3'b010;
		#1 x = 3'b000; y = 3'b011;
		#1 x = 3'b000; y = 3'b100;
		#1 x = 3'b000; y = 3'b101;
		#1 x = 3'b000; y = 3'b110;
		#1 x = 3'b000; y = 3'b111;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b010;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b001; y = 3'b100;
		#1 x = 3'b001; y = 3'b101;
		#1 x = 3'b001; y = 3'b110;
		#1 x = 3'b001; y = 3'b111;
		#1 x = 3'b010; y = 3'b000;
		#1 x = 3'b010; y = 3'b001;
		#1 x = 3'b010; y = 3'b010;
		#1 x = 3'b010; y = 3'b011;
		#1 x = 3'b010; y = 3'b100;
		#1 x = 3'b010; y = 3'b101;
		#1 x = 3'b010; y = 3'b110;
		#1 x = 3'b010; y = 3'b111;
		#1 x = 3'b100; y = 3'b000;
		#1 x = 3'b100; y = 3'b001;
		#1 x = 3'b100; y = 3'b010;
		#1 x = 3'b100; y = 3'b011;
		#1 x = 3'b100; y = 3'b100;
		#1 x = 3'b100; y = 3'b101;
		#1 x = 3'b100; y = 3'b110;
		#1 x = 3'b100; y = 3'b111;
		#1 x = 3'b101; y = 3'b000;
		#1 x = 3'b101; y = 3'b001;
		#1 x = 3'b101; y = 3'b010;
		#1 x = 3'b101; y = 3'b011;
		#1 x = 3'b101; y = 3'b100;
		#1 x = 3'b101; y = 3'b101;
		#1 x = 3'b101; y = 3'b110;
		#1 x = 3'b101; y = 3'b111;
		#1 x = 3'b110; y = 3'b000;
		#1 x = 3'b110; y = 3'b001;
		#1 x = 3'b110; y = 3'b010;
		#1 x = 3'b110; y = 3'b011;
		#1 x = 3'b110; y = 3'b100;
		#1 x = 3'b110; y = 3'b101;
		#1 x = 3'b110; y = 3'b110;
		#1 x = 3'b110; y = 3'b111;
		#1 x = 3'b111; y = 3'b000;
		#1 x = 3'b111; y = 3'b001;
		#1 x = 3'b111; y = 3'b010;
		#1 x = 3'b111; y = 3'b011;
		#1 x = 3'b111; y = 3'b100;
		#1 x = 3'b111; y = 3'b101;
		#1 x = 3'b111; y = 3'b110;
		#1 x = 3'b111; y = 3'b111;
		
   end
endmodule // test_Subtractor

/*

*/