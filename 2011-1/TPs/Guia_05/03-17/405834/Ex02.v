
module HalfSubtractor (s0,s1,a,b);
	output s0,s1;
	input a,b;

	xor XOR1 (s0,a,b);
	not NOT1 (f1,a);
	and AND1 (s1,b,f1);
endmodule

module FullSubtractor (s0,s1,a,b,c);
	output s0,s1;
	input a,b,c;

	HalfSubtractor HS1 (f1,f2,a,b);
	HalfSubtractor HS2 (s0,f3,f1,c);
	or OR1 (s1,f2,f3);
endmodule

module FullSubtractor3 (s0,s1,s2,s3,a0,a1,a2,b0,b1,b2);
	output s0,s1,s2,s3;
	input a0,a1,a2,b0,b1,b2;

	HalfSubtractor HS1 (s0,f1,a0,b0);
	FullSubtractor FS1 (s1,f2,f1,a1,b1);
	FullSubtractor FS2 (s2,s3,f2,a2,b2);
endmudule

module Teste;
	reg a0,a1,a2,b0,b1,b2;
	wire s0,s1,s2,s3;

	FullSubtractor3 FS3bits (s0,s1,s2,s3,a0,a1,a2,b0,b1,b2);

	initial begin
	a0=0; a1=0; a2=0;
	b0=0; b1=0; b2=0;

	$display ("Rafael Moreira Melo_405834: Guia05 Ex02: TESTE");

	$display ("Nao sei como utilizar o metodo 'for' nesta linguagem");
endmodule