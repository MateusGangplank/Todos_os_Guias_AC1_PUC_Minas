
module HalfAdder (s0,s1,a,b);
	output s0,s1;
	input a,b;
	
	xor XOR1 (s0,a,b);
	and AND1 (s1,a,b);
endmodule

module FullAdder (s0,s1,vai1,a,b);
	output s0,s1;
	input vai1,a,b;
	
	HalfAdder HA1 (f1,f2,a,b);
	HalfAdder HA2 (s0,f3,vai1,f1);
	or OR1 (s1,f3,f2);
endmodule

module FullAdder4 (s0,s1,s2,s3,s4,a0,a1,a2,a3,b0,b1,b2,b3);
	output s0,s1,s2,s3,s4;
	input a0,a1,a2,a3,b0,b1,b2,b3;
	
	HalAdder HA1 (s0,f1,a0,b0);
	FullAdder FA1 (s1,f2,f1,a1,b1);
	FullAdder FA2 (s2,f3,f2,a2,b2);
	FullAdder FA3 (s3,s4,f3,a3,b3);
endmodule

module Teste;
	reg a0,a1,a2,a3,b0,b1,b2,b3;
	wire s0,s1,s2,s3,s4;
	
	FullAdder4 FA4bits (s0,s1,s2,s3,s4,a0,a1,a2,a3,b0,b1,b2,b3);

	initial begin
	a0=0; a1=0; a2=0; a3=0;
	b0=0; b1=0; b2=0; b3=0;

	$display ("Rafael Moreira Melo_405834: Guia05 Ex01: TESTE");

	$display ("Nao sei como utilizar o metodo 'for' nesta linguagem");
endmodule