
// PUC - MG
// Nome: Henrique Carvalgo Parreira
// Matricula: 347133
//
//	Guia07	Programa2
//	Inclusão em uma ALU a operação de complemento de 2


module complemento1 ( s3,s2,s1,s0,  a3,a2,a1,a0 );
	output s4,s3,s2,s1,s0;
	input a3,a2,a1,a0;
	
	not NOT1 ( s0,a0 );
	not NOT2 ( s1,a1 );
	not NOT3 ( s2,a2 );
	not NOT4 ( s3,a3 );
	
endmodule//complemento1

//---------------------

module halfadder ( resto,vai1,		a,b );
	output resto,vai1;
	input a,b;
	
	xor XOR1 ( resto, 	a,b );
	and AND1 ( vai1,		a,b );
	
endmodule//halfadder

//---------------------

module fulladder ( resto,vai1,		vem1,a,b );
	output resto,vai1;
	input vem1,a,b;
	wire w1,w2,w3;
	
	xor XOR1 ( w1,			a,b);
	and AND1 ( w2,			a,b);
	xor XOR2 ( resto,		w1,vem1);
	and AND2 ( w3,			w1,vem1);
	or OR1 	( vai1,		w2,w3);
	
endmodule//fulladder

//---------------------

module completeadder ( s4,s3,s2,s1,s0,		a3,a2,a1,a0 );
	output s4,s3,s2,s1,s0;
	input a3,a2,a1,a0;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
	
	halfadder HALF1 ( s0,w1,	a0,1 );
	fulladder FULL1 ( s1,w2,	w1,a1,0 );
	fulladder FULL2 ( s2,w3,	w2,a2,0 );
	fulladder FULL3 ( s3,s4,	w3,a3,0 );

endmodule//completeadder

//---------------------
//--MODULO PRINCIPAL--
//---------------------

module testeguia07;
	reg a3,a2,a1,a0,  b3,b2,b1,b0;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;
	
	complemento1 COMPL1 ( w2,w3,w4,w5,	 		a3,a2,a1,a0);
	complemento1 COMPL2 ( w7,w8,w9,w10,	 		b3,b2,b1,b0);
	completeadder COMPLE1 ( w11,w12,w13,w14,w15,	 		w2,w3,w4,w5);
	completeadder COMPLE2 ( w16,w17,w18,w19,w20,	 		w7,w8,w9,w10);
	
initial begin:start
end

//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia07 - Programa1");
	$display ("Henrique Carvalho Parreira		347133\n");
	$display ("Relatorio de Testes");
	#1	a3=0;a2=0;a1=0;a0=0;  b3=0;b2=0;b1=0;b0=0;
	$monitor ("A [%b | %b %b %b] => %b-A+1[%b | %b %b %b] 	B[%b | %b %b %b] => %b-B+1[%b | %b %b %b]", a3,a2,a1,a0,		 w11,w12,w13,w14,w15,			b3,b2,b1,b0,			w16,w17,w18,w19,w20, );
	#1 a0 = 1;
	#1 b0 = 1;
	#1 a0 = 0; a1 = 1; b2 = 1;
	#1 a2=1; a3=1; a1=0; b2=0; b1=1; b0=1;
	
end
endmodule


//---------------------
//-RELATORIO DE TESTES-
//---------------------
/*
	 A [0 | 0 0 0] => 1-A+1[0 | 0 0 0] 	B[0 | 0 0 0] => 1-B+1[0 | 0 0 0] 
    A [0 | 0 0 1] => 0-A+1[1 | 1 1 1] 	B[0 | 0 0 0] => 1-B+1[0 | 0 0 0] 
    A [0 | 0 0 1] => 0-A+1[1 | 1 1 1] 	B[0 | 0 0 1] => 0-B+1[1 | 1 1 1] 
    A [0 | 0 1 0] => 0-A+1[1 | 1 1 0] 	B[0 | 1 0 1] => 0-B+1[1 | 0 1 1] 
    A [1 | 1 0 0] => 0-A+1[0 | 1 0 0] 	B[0 | 0 1 1] => 0-B+1[1 | 1 0 1] 

*/