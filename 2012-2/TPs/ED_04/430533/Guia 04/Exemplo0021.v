// ------------------------- 
// Exemplo0021 - FULL ADDER
// Nome: Roger Rubens Machado
// Matricula: 430533
// ------------------------- 

// half adder 
	
module halfAdder( s0, carry_out, a, b);
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);

endmodule 
	 
// full adder 
	
module fullAdder(s0, carry_out, a, b, carry_in);
	input a, b, carry_in;
	output s0, carry_out;
	wire [2:0]f;
	
	xor XOR1(f[0], a, b);
	xor XOR2(s0, f[0], carry_in);
	and AND1(f[1], f[0], carry_in);
	and AND2(f[2], a, b);
	or OR1(carry_out, f[1], f[2]);
	
endmodule

// full adder 4 bits

module fullAdder4 (output [2:0]s,output carry_out, input [2:0]a, input [2:0]b); 
	
	// descrever por portas
	wire c_in;
	wire c_in1;
	wire carry_out;
	
	halfAdder HA1(s[0], c_in, a[0], b[0]);
	fullAdder FA1(s[1], c_in1, a[1], b[1], c_in);
	fullAdder FA2(s[2], carry_out, a[2], b[2], c_in1);	

// descrever por portas 
	endmodule // fullAdder 
	module test_fullAdder4; 

	reg [2:0] x; 
	reg [2:0] y; 
	reg carry; 
	wire [2:0] soma; 

initial begin 
	$display("Exemplo0021 - Nome: Roger Rubens Machado - 430533"); 
	$display("Test ALU's full ad  der"); 

	#1 x = 0000; y = 0000;
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n", x, y, soma); 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;  
	
end 
endmodule // test_fullAdder 