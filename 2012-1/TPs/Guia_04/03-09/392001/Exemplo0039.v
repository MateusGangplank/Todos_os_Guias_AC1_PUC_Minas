// ------------------------- 
// Exemplo00039 - FULL SUB 
// Nome: Flavio Andrade Amaral Motta 
// Matricula: 392001
// ------------------------- 

// ------------------------- 
// half adder 
// ------------------------- 
	
	module halfAdder( s0,carry_out, a, b);
	
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);

	endmodule 

// ------------------------- 
// half Subtractor
// ------------------------- 
	
	module halfSub( s0,s1, a, b);
	
	input a, b;
	output s0, s1;
	
	xor XOR1(s0, a, b);
	and AND1(s1, ~a, b);

	endmodule 
	
// ------------------------- 
// full Subtractor
// -------------------------	
	
	module fullSub(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire f0, f1, f2;
	
	halfAdder HA1(f0, f1, a, b);
	halfAdder HA2(s0, f2, c, f0);
	or OR1(s1, f2, f1);
	
	endmodule
	

// ------------------------- 
// full subtractor 4 bits
// -------------------------	
	

	module fullSub4 (output [3:0]s,
	output carryOut, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire carry_in;
	wire carry_in1;
	wire carry_in2;
	
	
	halfSub HS1(s[0], carry_in, a[0], b[0]);
	fullSub FS1(s[1], carry_in1, a[1], b[1], carry_in);
	fullSub FS2(s[2], carry_in2, a[2], b[2], carry_in1);	
	fullSub FS3(s[3], carryOut, a[3], b[3],carry_in2);
	
	

// descrever por portas 
	endmodule // fullSub 
	module test_fullSub4; 

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg carry; 
	wire [3:0] sub; 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00039 - Flavio Andrade Amaral Motta - 392001"); 
	$display("Test ALU's full subtractor"); 

// projetar testes do sobtrator complete 
	
	#1 x = 1101; y = 0001;
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n",x,y,sub);
	#1 x = 0001; y = 0001;
	#1 x = 0011; y = 0001;
	#1 x = 1110; y = 1100;  
	
end 
endmodule // test_fullAdder 