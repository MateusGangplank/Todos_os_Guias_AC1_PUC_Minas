// ---------------------------
// -- Exemplo0021 FULL ADDER
// -- Alexandre Palmieri Sad
// -- 440265
// ---------------------------

// ---------------------------
// -- HALF ADDER
// ---------------------------
module halfAdder(output s,
					  output carryOut,
						input a,
						input carryIn);
	xor A(carryOut, carryIn, a);
	and B(s, a, carryIn);
endmodule

// ---------------------------
// -- FULL ADDER
// ---------------------------
module fullAdder(output s,
					  output carryOut,
					  input carryIn,
					  input a,
					  input b);
	
	wire c0, s0, s1;
	halfAdder A(s0, c0, a, carryIn);
	halfAdder B(s1, s, b, c0 );
	or 		 C(carryOut, s0, s1);
endmodule

// ---------------------------
// -- FULL ADDER 4Bits
// ---------------------------
module fullAdder4B(output [3:0]s,
						 output co,
							input[3:0]a,
							input[3:0]b,
							input ci);
	wire [2:0]c;
	fullAdder A(s[0], c[0], ci, b[0], a[0]);
	fullAdder B(s[1], c[1], c[0], a[1], b[1]);
	fullAdder C(s[2], c[2], c[1], a[2], b[2]);
	fullAdder D(s[3],   co, c[2], a[3], b[3]);

endmodule

// ---------------------------
module testefullAdder;
// ----------- definir dados
	reg [3:0]x;
	reg [3:0]y;
	reg c;
	wire [3:0]s;
	wire carryOut;
	fullAdder4B F1(s, carryOut, x, y ,c);
	
	
	initial begin 
		$display("Test ALU's full adder"); 
		
	// --projetar testes do somador completo
		#1 x = 4'b1101; y = 4'b0011; c = 0;
		$monitor("%4b + %4b  = %4b", x, y, s);
		#1 x = 4'b0001; y = 4'b0001; c = 0;
		#1 x = 4'b0010; y = 4'b0010; c = 0;
		#1 x = 4'b0001; y = 4'b0001; c = 0;
		#1 x = 4'b0011; y = 4'b0011; c = 0;
		#1 x = 4'b0001; y = 4'b0001; c = 0;
		#1 x = 4'b0010; y = 4'b0001; c = 0;
		#1 x = 4'b0001; y = 4'b0011; c = 0;
		#1 x = 4'b0011; y = 4'b0100; c = 0;
		#1 x = 4'b0111; y = 4'b0001; c = 0;
		#1 x = 4'b0110; y = 4'b0111; c = 0;
		#1 x = 4'b0001; y = 4'b0001; c = 0;
		#1 x = 4'b0011; y = 4'b0011; c = 0;
		#1 x = 4'b0001; y = 4'b0001; c = 0;
		#1 x = 4'b0010; y = 4'b0001; c = 0;
		#1 x = 4'b0001; y = 4'b0011; c = 0;
		#1 x = 4'b0011; y = 4'b0100; c = 0;
	end
endmodule