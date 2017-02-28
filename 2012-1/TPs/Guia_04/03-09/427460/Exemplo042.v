// -------------------------
// Exemplo00042 - ComplementoDois
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 


// ------------------------- 
// Complemento de Um
// ------------------------- 

	module Complemento1(output [3:0]sC, 
	input [3:0]a);
		
	
	not NOT1(sC[0], a[0]);
	not NOT2(sC[1], a[1]);
	not NOT3(sC[2], a[2]);
	not NOT4(sC[3], a[3]);
	
	endmodule


// ------------------------- 
// half adder 
// ------------------------- 
	
	module halfAdder( s0,s1, a, b);
	
	input a, b;
	output s0, s1;
	
	xor XOR1(s0, a, b);
	and AND1(s1, a, b);

	endmodule 
	
// ------------------------- 
// full adder 
// -------------------------	
	
	module fullAdder(s0, s1, a, b, c);
	
	input a, b, c;
	output s0, s1;
	wire q0, q1, q2;
	
	halfAdder HA1(q0, q1, a, b);
	halfAdder HA2(s0, q2, c, q0);
	or OR1(s1, q2, q1);
	
	endmodule
	

// ------------------------- 
// full adder 4 bits
// -------------------------	
	

	module fullAdder4 (output [3:0]s,
	output carryOut,
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire vaiUm;
	wire vaiUm1;
	wire vaiUm2;
	
	
	
	halfAdder HA1(s[0], vaiUm, a[0], b[0]);
	fullAdder FA1(s[1], vaiUm1, a[1], b[1],vaiUm);
	fullAdder FA2(s[2], vaiUm2, a[2], b[2],vaiUm1);	
	fullAdder FA3(s[3], carryOut, a[3], b[3],vaiUm2);
	
	

// descrever por portas 
	endmodule // fullAdder 
	 
	
// ------------------------- 
// Complemento de Dois
// -------------------------
	
	module ComplementoDois(output [3:0]s, input [3:0]a);
	
	wire [3:0]s_half;
	wire carryOut;
	
	Complemento1 c1(s_half, a);
	
	fullAdder4 FA1(s ,carryOut, s_half, 4'b0001);
		
	endmodule

// ------------------------- definir dados 
	
	module teste;
	
	reg [3:0] x; 
	wire [3:0] soma;
	
	ComplementoDois CD(soma, x);
	 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00042 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test ALU's Complemento de Dois"); 
	
	#1 x = 0100;
	
// projetar testes do ComplementoDois
	
	$monitor("x = %4b \t  saida = %5b\n",x,soma);
	#1 x = 0000;  
	#1 x = 0001; 
	#1 x = 0000; 
	#1 x = 1111; 
	
end 
endmodule // test_ComplementoDois