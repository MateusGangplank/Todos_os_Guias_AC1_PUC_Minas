// ------------------------- 
// Exemplo0022 - FULL SUB 
// Nome: Roger Rubens Machado
// Matricula: 430533
// ------------------------- 

// half adder 
	
module halfAdder( s0,carry_out, a, b);
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);

endmodule 

// half Subtractor
	
module halfSub(s0, carry_out, a, b);
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, ~a, b);

endmodule 
	 
// full Subtractor	
	
module fullSub(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire f0, f1, f2;
	
	halfAdder HA1(f0, f1, a, b);
	halfAdder HA2(s0, f2, c, f0);
	or OR1(s1, f2, f1);
	
endmodule

// full subtractor 4 bits	

module fullSub4 (output [2:0]s, output carry_out, input [2:0]a, input [2:0]b); 
	
	// descrever por portas
	wire carry_in;
	wire carry_in1;	
	
	halfSub HS1(s[0], carry_in, a[0], b[0]);
	fullSub FS1(s[1], carry_in1, a[1], b[1], carry_in);
	fullSub FS2(s[2], carry_out, a[2], b[2], carry_in1);	
 
endmodule // fullSub 

	module test_fullSub4; 

	reg [2:0] x; 
	reg [2:0] y; 
	reg carry; 
	wire [2:0] sub; 
	 
initial begin 
	$display("Exemplo0022 - Roger Rubens Machado - 430533"); 
	$display("Test ALU's full subtractor"); 
	
	#1 x = 1101; y = 0001;
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n", x, y, sub);
	#1 x = 0001; y = 0001;
	#1 x = 0011; y = 0001;
	#1 x = 1110; y = 1100;  
	
end 
endmodule // test_fullAdder 