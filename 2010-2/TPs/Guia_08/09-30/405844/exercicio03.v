// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia07	Programa 3
//	Fazer a saida para a função ¬a¬b¬d + ¬a¬c¬d + ¬a¬b¬c + a¬cd + a¬bc
//
// ---------------------

module guia08;
	reg a,b,c,d,e;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
	
	not NOT1 (w1,a);
	not NOT2 (w2,b);
	not NOT3 (w3,c);
	not NOT4 (w4,d);
	not NOT5 (w5,e);
	
	and AND1 (w6,c,e);
	and AND2 (w7,w1,w3,w4);
	and AND3 (w8,b,c,d,w5);
	and AND4 (w9,a,w2,w4,e);
	and AND5 (w10,a,c,d,e);
	and AND6 (w11,a,w2,w3,d,w5);
	or OR1 (w12,w6,w7,w8,w9,w10,w11);
	
initial begin:start
end

//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia08 - Exercicio 02");
	$display ("Fazer a saida para a função\n¬(abd) + ¬(acd) + ¬(abc) + a¬cd + a¬bc\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matricula:405844\n");
	$display ("Relatorio de Testes");
	#1	a = 0; b= 0; c = 0; d = 0; e = 0;
	$monitor ("a = %b b = %b c = %b d = %b e = %b	Saida [%b]", a,b,c,d,e,		 w12);
	#1 a = 0; b = 0;  c = 0; d = 1; e = 0;
	#1 a = 0; b = 0;  c = 1; d = 0; e = 0;
	#1 a = 0; b = 0;  c = 1; d = 1; e = 0;
	#1 a = 0; b = 1;  c = 0; d = 0; e = 1;
	#1 a = 0; b = 1;  c = 0; d = 1; e = 1;
	#1 a = 0; b = 1;  c = 1; d = 0; e = 1;
	#1 a = 0; b = 1;  c = 1; d = 1; e = 1;
	#1 a = 0; b = 0;  c = 0; d = 0; e = 0;
	#1 a = 0; b = 0;  c = 0; d = 1; e = 0;
	#1 a = 0; b = 0;  c = 1; d = 0; e = 0;
	#1 a = 0; b = 0;  c = 1; d = 1; e = 0;
	#1 a = 0; b = 1;  c = 0; d = 0; e = 1;
	#1 a = 0; b = 1;  c = 0; d = 1;e = 1;
	#1 a = 0; b = 1;  c = 1; d = 0; e = 1;
	#1 a = 0; b = 1;  c = 1; d = 1; e = 1;
	
	#1 a = 1; b = 0;  c = 0; d = 1; e = 0;
	#1 a = 1; b = 0;  c = 0; d = 1; e = 0;
	#1 a = 1; b = 0;  c = 1; d = 0; e = 0;
	#1 a = 1; b = 0;  c = 1; d = 1; e = 0;
	#1 a = 1; b = 1;  c = 0; d = 0; e = 1;
	#1 a = 1; b = 1;  c = 0; d = 1; e = 1;
	#1 a = 1; b = 1;  c = 1; d = 0; e = 1;
	#1 a = 1; b = 1;  c = 1; d = 1; e = 1;
	#1 a = 1; b = 0;  c = 0; d = 0; e = 0;
	#1 a = 1; b = 0;  c = 0; d = 1; e = 0;
	#1 a = 1; b = 0;  c = 1; d = 0; e = 0;
	#1 a = 1; b = 0;  c = 1; d = 1; e = 0;
	#1 a = 1; b = 1;  c = 0; d = 0; e = 1;
	#1 a = 1; b = 1;  c = 0; d = 1; e = 1;
	#1 a = 1; b = 1;  c = 1; d = 0; e = 1;
	#1 a = 1; b = 1;  c = 1; d = 1; e = 1;
	
end
endmodule


//---------------------
//-RELATORIO DE TESTES-
//---------------------
/*
    a = 0 b = 0 c = 0 d = 0 e = 0	Saida [1]
    a = 0 b = 0 c = 0 d = 1 e = 0	Saida [0]
    a = 0 b = 0 c = 1 d = 0 e = 0	Saida [0]
    a = 0 b = 0 c = 1 d = 1 e = 0	Saida [0]
    a = 0 b = 1 c = 0 d = 0 e = 1	Saida [1]
    a = 0 b = 1 c = 0 d = 1 e = 1	Saida [0]
    a = 0 b = 1 c = 1 d = 0 e = 1	Saida [1]
    a = 0 b = 1 c = 1 d = 1 e = 1	Saida [1]
    a = 0 b = 0 c = 0 d = 0 e = 0	Saida [1]
    a = 0 b = 0 c = 0 d = 1 e = 0	Saida [0]
    a = 0 b = 0 c = 1 d = 0 e = 0	Saida [0]
    a = 0 b = 0 c = 1 d = 1 e = 0	Saida [0]
    a = 0 b = 1 c = 0 d = 0 e = 1	Saida [1]
    a = 0 b = 1 c = 0 d = 1 e = 1	Saida [0]
    a = 0 b = 1 c = 1 d = 0 e = 1	Saida [1]
    a = 0 b = 1 c = 1 d = 1 e = 1	Saida [1]
    a = 1 b = 0 c = 0 d = 1 e = 0	Saida [1]
    a = 1 b = 0 c = 1 d = 0 e = 0	Saida [0]
    a = 1 b = 0 c = 1 d = 1 e = 0	Saida [0]
    a = 1 b = 1 c = 0 d = 0 e = 1	Saida [0]
    a = 1 b = 1 c = 0 d = 1 e = 1	Saida [0]
    a = 1 b = 1 c = 1 d = 0 e = 1	Saida [1]
    a = 1 b = 1 c = 1 d = 1 e = 1	Saida [1]
    a = 1 b = 0 c = 0 d = 0 e = 0	Saida [0]
    a = 1 b = 0 c = 0 d = 1 e = 0	Saida [1]
    a = 1 b = 0 c = 1 d = 0 e = 0	Saida [0]
    a = 1 b = 0 c = 1 d = 1 e = 0	Saida [0]
    a = 1 b = 1 c = 0 d = 0 e = 1	Saida [0]
    a = 1 b = 1 c = 0 d = 1 e = 1	Saida [0]
    a = 1 b = 1 c = 1 d = 0 e = 1	Saida [1]
    a = 1 b = 1 c = 1 d = 1 e = 1	Saida [1]
*/