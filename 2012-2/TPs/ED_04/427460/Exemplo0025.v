// -------------------------
// Exemplo0025 - ComplementoDois
// Nome: Roger Rubens Machado
// Matricula: 427460 
// ------------------------- 

// Complemento de Um 

module Complemento1(output [2:0]sC, input [2:0]a);

	not NOT1(sC[0], a[0]);
	not NOT2(sC[1], a[1]);
	not NOT3(sC[2], a[2]);
	
endmodule

// half adder 
	
module halfAdder( s0, carry_out, a, b);
	
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);

endmodule
	
// full adder 
	
module fullAdder(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire q0, q1, q2;
	
	halfAdder HA1(q0, q1, a, b);
	halfAdder HA2(s0, q2, c, q0);
	or OR1(s1, q2, q1);
	
endmodule
	 
// full adder 3 bits	

module fullAdder3 (output [2:0]s, input [2:0]a, input [2:0]b); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire carry_out;
	
	halfAdder ha1(s[0], vaiUm, a[0], b[0]);
	fullAdder ha2(s[1], vaiUm1, a[1], b[1], vaiUm);
	fullAdder ha3(s[2], carry_out, a[2], b[2], vaiUm1);	

endmodule // fullAdder 
	 
// Complemento de Dois
	
module ComplementoDois(output [2:0]s, output carry_out, input [2:0]a, input [2:0]b);
	
	wire s_half;
	wire s_half1;
	wire s_half2;
	
	Complemento1 c1(s_half , a[0]);
	Complemento1 c2(s_half1, a[1]);
	Complemento1 c3(s_half2, a[2]);
	
	fullAdder3 FA1(s[0],s_half, b[0]);
	fullAdder3 FA2(s[1],s_half1, b[1]);
	fullAdder3 FA3(s[2],s_half2, b[2]);

endomodule

	module test_ComplementoDois; 
	reg [2:0] x; 
	reg [2:0] y; 
	reg carry; 
	wire [2:0] soma; 
	ComplementoDois(soma, x, y);
initial begin 
	$display("Exemplo0025 - Roger Rubens Machado - 430533"); 
	$display("Test ALU's Complemento de Dois"); 
	
	$monitor("x = %3b \t y = %3b\t  saida = %3b\n", x, y, soma);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;  
	
end 
endmodule // test_ComplementoDois