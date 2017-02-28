// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia06	Programa1
//	Projeto de uma ALU para 4 bits com somador completo e comparador igualdade
//
// ---------------------

module halfadder ( resto,vai1,a,b );
	output resto,vai1;
	input a,b;
	
	xor XOR1 (resto,a,b);
	and AND1 (vai1,a,b);
	
endmodule//halfadder

module fulladder ( resto,vai1,vem1,a,b );
	output resto,vai1;
	input vem1,a,b;
	wire w1,w2,w3;
	
	xor XOR1 (w1,a,b);
	and AND1 (w2,a,b);
	xor XOR2 (resto,w1,vem1);
	and AND2 (w3,vem1,w1);
	or OR1 (v1,w3,w2);
	
endmodule//fulladder


module comparator ( s,sinal1,a2,a1,a0,sinal2,b2,b1,b0 );
	output s;
	input sinal1,sinal2,a2,a1,a0,b2,b1,b0;
	wire w1,w2,w4,w3;
	
	xnor XNOR1 (w1,a0,b0);
	xnor XNOR2 (w2,a1,b1);
	xnor XNOR3 (w3,a2,b2);
	xnor XNOR4 (w4,sinal1,sinal2);
	and AND1 (s,w1,w2,w3,w4);
	
endmodule//comparator

module completeadder ( s0,s1,s2,s3,s4,sinal1,a2,a1,a0,sinal2,b2,b1,b0 );
	output s0,s1,s2,s3,s4;
	input sinal1,a2,a1,a0,sinal2,b2,b1,b0;
	wire w1,w2,w3,w4,w5,w6;
	
	halfadder HALF1 ( s4,w1,a0,b0 );
	fulladder FULL1 ( s3,w2,w1,a1,b1 );
	fulladder FULL2 ( s2,w3,w2,a2,b2 );
	fulladder FULL3 ( s1,s0,w3,sinal1,sinal2 );
	
endmodule//completeadder

module testeguia06;
	reg s1,a2,a1,a0,s2,b2,b1,b0;
	wire w1,w2,w3,w4,w5,w6;
	
	comparator COMP1 (w1,s1,a2,a1,a0,s2,b2,b1,b0);
	completeadder COMPLA1 (w2,w3,w4,w5,w6,s1,a2,a1,a0,s2,b2,b1,b0 );
	
initial begin:start
end

//PARTE PRICIPAL

initial begin:main
	$display ("Guia06 - Programa1");
	$display ("Projeto de uma ALU para 4 bits com somador completo e comparador\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matricula:405844\n");
	$display ("Relatorio de Testes");
	#1	a0 = 0; a2 = 0; a1 = 0; b1 = 0; b2 = 0; b0 = 0; s1 = 0; s2 = 0;
	$monitor ("%b | %b %b %b  +  %b | %b %b %b  = %b | %b | %b %b %b  Iguais[ %b ]",s1,a2,a1,a0,s2,b2,b1,b0,w2,w3,w4,w5,w6,w1);
	#1 a0 = 1;
	#1 b0 = 1;
	#1 a0 = 0; a1 = 1; b2 = 1;
	
end
endmodule