// ---------------------
//	Programação em Verilog
//
// PUC - MG
// Nome: Tiago Menegaz de Melo Garcia
// Matricula: 405844
//
//	Guia07	Programa 4
//	Refazer o Programa 1 com apenas portas NAND
//
// ---------------------

module notnand (saida,entrada);
	input entrada;
	output saida;
	
	nand NAND1 (saida,entrada);
endmodule//endmodule

module andnand (saida,e1,e2,e3);
	input e1,e2,e3;
	output saida;
	wire w1;
	
	nand NAND1 (w1,e1,e2,e3);
	nand NAND2 (saida,w1);
endmodule//andnand

module ornand (saida,e1,e2,e3);
	input e1,e2,e3;
	output saida;
	wire w1,w2,w3;
	
	nand NAND1 (w1,e1);
	nand NAND2 (w2,e2);
	nand NAND3 (w3,e3);
	nand NAND4 (saida,w1,w2,w3);
endmodule//ornand

module andnand2 (saida,e1,e2);
	input e1,e2;
	output saida;
	wire w1;
	
	nand NAND1 (w1,e1,e2);
	nand NAND2 (saida,w1);
endmodule//	

module guia08;
	reg a,b,c,d;
	wire w1,w2,w3,w4,w5,w6,w7,w8;
	
	notnand NN1 (w1,a);
	notnand NN2 (w2,b);
	notnand NN3 (w3,c);
	notnand NN4 (w4,d);
	
	andnand2 AN1 (w5,w1,c);
	andnand AN2 (w6,a,b,w4);
	andnand AN3 (w7,a,w2,c);
	ornand ON1 (w8,w5,w6,w7);
	
initial begin:start
end

//---------------------
//---PARTE PRINCIPAL---
//---------------------

initial begin:main
	$display ("Guia08 - Exercicio01");
	$display ("Fazer a saida para a função\n¬ac + ab¬d + a¬bc\n");
	$display ("Aluno: Tiago Menegaz de Melo Garcia		Matricula:405844\n");
	$display ("Relatorio de Testes");
	#1	a = 0; b= 0; c = 0; d = 0;
	$monitor ("a = %b b = %b c = %b d = %b Saida [%b]", a,b,c,d,		 w8);
	#1 a = 1;
	#1 a = 0; b = 1;
	#1 b = 0; c = 1;
	#1 c = 0; d = 1;
	#1 d = 0;
	#1 a = 1; b = 1; c = 1; d = 1;
	#1 a = 0; c = 0;
	#1 a = 1; c = 1;
	
end
endmodule


//---------------------
//-RELATORIO DE TESTES-
//---------------------
/*
	 a = 0 b = 0 c = 0 d = 0 Saida [0]
    a = 1 b = 0 c = 0 d = 0 Saida [0]
    a = 0 b = 1 c = 0 d = 0 Saida [0]
    a = 0 b = 0 c = 1 d = 0 Saida [1]
    a = 0 b = 0 c = 0 d = 1 Saida [0]
    a = 0 b = 0 c = 0 d = 0 Saida [0]
    a = 1 b = 1 c = 1 d = 1 Saida [0]
    a = 0 b = 1 c = 0 d = 1 Saida [0]
    a = 1 b = 1 c = 1 d = 1 Saida [0]
*/