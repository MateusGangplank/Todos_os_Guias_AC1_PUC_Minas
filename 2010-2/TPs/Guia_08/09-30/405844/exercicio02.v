// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia07	Programa 2
//	Fazer a saida para a função ¬a¬b¬d + ¬a¬c¬d + ¬a¬b¬c + a¬cd + a¬bc
//
// ---------------------

module guia08;
	reg a,b,c,d;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;
	
	not NOT1 (w1,a);
	not NOT2 (w2,b);
	not NOT3 (w3,c);
	not NOT4 (w4,d);
	
	and AND1 (w5,w1,w2,w4);
	and AND2 (w6,w1,w3,w4);
	and AND3 (w7,a,w2,w3);
	and AND4 (w8,a,w3,d);
	and AND5 (w9,a,w2,d);
	or OR1 (w10,w5,w6,w7,w8,w9);
	
initial begin:start
end

//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia08 - Exercicio 02");
	$display ("Fazer a saida para a função\n¬a¬b¬d + ¬a¬c¬d + ¬a¬b¬c + a¬cd + a¬bc\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matricula:405844\n");
	$display ("Relatorio de Testes");
	#1	a = 0; b= 0; c = 0; d = 0;
	$monitor ("a = %b b = %b c = %b d = %b Saida [%b]", a,b,c,d,		 w10);
	#1 a = 0; b = 0;  c = 0; d = 1;
	#1 a = 0; b = 0;  c = 1; d = 0;
	#1 a = 0; b = 0;  c = 1; d = 1;
	#1 a = 0; b = 1;  c = 0; d = 0;
	#1 a = 0; b = 1;  c = 0; d = 1;
	#1 a = 0; b = 1;  c = 1; d = 0;
	#1 a = 0; b = 1;  c = 1; d = 1;
	#1 a = 1; b = 0;  c = 0; d = 0;
	#1 a = 1; b = 0;  c = 0; d = 1;
	#1 a = 1; b = 0;  c = 1; d = 0;
	#1 a = 1; b = 0;  c = 1; d = 1;
	#1 a = 1; b = 1;  c = 0; d = 0;
	#1 a = 1; b = 1;  c = 0; d = 1;
	#1 a = 1; b = 1;  c = 1; d = 0;
	#1 a = 1; b = 1;  c = 1; d = 1;
	
end
endmodule


//---------------------
//-RELATORIO DE TESTES-
//---------------------
/*
a = 0 b = 0 c = 0 d = 0 Saida [1]
    a = 0 b = 0 c = 0 d = 1 Saida [0]
    a = 0 b = 0 c = 1 d = 0 Saida [1]
    a = 0 b = 0 c = 1 d = 1 Saida [0]
    a = 0 b = 1 c = 0 d = 0 Saida [1]
    a = 0 b = 1 c = 0 d = 1 Saida [0]
    a = 0 b = 1 c = 1 d = 0 Saida [0]
    a = 0 b = 1 c = 1 d = 1 Saida [0]
    a = 1 b = 0 c = 0 d = 0 Saida [1]
    a = 1 b = 0 c = 0 d = 1 Saida [1]
    a = 1 b = 0 c = 1 d = 0 Saida [0]
    a = 1 b = 0 c = 1 d = 1 Saida [1]
    a = 1 b = 1 c = 0 d = 0 Saida [0]
    a = 1 b = 1 c = 0 d = 1 Saida [1]
    a = 1 b = 1 c = 1 d = 0 Saida [0]
    a = 1 b = 1 c = 1 d = 1 Saida [0]*/