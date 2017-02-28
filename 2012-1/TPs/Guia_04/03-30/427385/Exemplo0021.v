// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

// ------------------------- 
// --- halfAdder
// ------------------------- 
module halfAdder (output saida, output carryOut, input a, input b);
	
	xor XOR1 (saida, a, b);
	and AND1 (carryOut, a, b);
	
endmodule // -- halfAdder

// ------------------------- 
// --- fullAdder
// ------------------------- 
module fullAdder (output saida, output carryOut, input a, input b, input carryIn);
	
	wire [2:0]s;
	
	halfAdder HA1 (s[0], s[1], a, b);
	halfAdder HA2 (saida, s[2], s[0], carryIn);
	
	or OR1 (carryOut, s[1], s[2]);

endmodule // -- fullAdder

// ------------------------- 
// --- fullAdder 2
// ------------------------- 
module fullAdder2 (output [3:0]saida, output carryOut, input [3:0]a, input [3:0]b, input carryIn);
	
	wire [2:0]s;
	
	fullAdder FA1 (saida[0], s[0], a[0], b[0], carryIn);
	fullAdder FA2 (saida[1], s[1], a[1], b[1], s[0]);
	fullAdder FA3 (saida[2], s[2], a[2], b[2], s[1]);
	fullAdder FA4 (saida[3], carryOut, a[3], b[3], s[2]);

endmodule // -- fullAdder 2

// ------------------------- 
// --- modulo de teste full adder 2
// -------------------------
module test_fullAdder2;
	
	reg  [3:0] x;
	reg  [3:0] y;
	reg  cIn;
	
	wire [3:0] z;
	wire cOut;
	
	fullAdder2 modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0021 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU's full adder \n");
		$display("x + y\t + carryIn\t = carryOut\t saida\n");
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 0;
		$monitor("%4b + %4b\t + %b\t = %b\t %4b", x, y, cIn, cOut, z);
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 1;
		
		#1 x = 4'b1010; y = 4'b1100; cIn = 0;
		#1 x = 4'b1010; y = 4'b1100; cIn = 1;
		
		#1 x = 4'b1110; y = 4'b0110; cIn = 0;
		#1 x = 4'b1110; y = 4'b0110; cIn = 1;
		
		#1 x = 4'b0011; y = 4'b0100; cIn = 0;
		#1 x = 4'b0011; y = 4'b0100; cIn = 1;
		
	end
	
endmodule // -- test_fullAdder2
// --- previsao de testes
// -- x + y	 + carryIn	 = carryOut	 saida
// --
// -- 0001 + 0010	 + 0	 = 0	 0011
// -- 0001 + 0010	 + 1	 = 0	 0100
// -- 1010 + 1100	 + 0	 = 1	 0110
// -- 1010 + 1100	 + 1	 = 1	 0111
// -- 1110 + 0110	 + 0	 = 1	 0100
// -- 1110 + 0110	 + 1	 = 1	 0101
// -- 0011 + 0100	 + 0	 = 0	 0111
// -- 0011 + 0100	 + 1	 = 0	 1000
