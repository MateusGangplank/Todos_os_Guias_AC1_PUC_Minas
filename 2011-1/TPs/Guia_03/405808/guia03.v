//-- Programa para a Disciplina Arquitetura de Computadores I
//-- Pont�fica Universidade Cat�lica de Minas Gerais - PUC Minas
//-- Aluno : Jos� Ferreira Reis Fonseca - Matr�cula 405808
//-- Atividade Guia 01


//-------- GUIA 03 - TOTALIDADE DO PROGRAMA - VERS�O 0.1 - 20/02/2011

module EXS;
	
	reg a, b;
	
	//--exercicio 1
	wire s01, s11;
	
	//--exercicio 2
	wire sm2, s02, s12, smeio2, sup2, sdown2;
	
	//--exercicio 3
	wire s03, sm3, sn3;
	
	//-- exercicio 1	
	and AND1 (s01, a, b);            // TENTE DEFINIR UM MODULO PARA CADA EXERCICIO
	xor XOR1 (s11, a, b);
	
	//--exercicio 2 (e 3)
	nand NAND12 (sm2, a, b);
	nand NAND22 (s02, sm2, sm2);
	nand xormeio (smeio2, a, b);
	nand xorup (sup2, smeio2, a);
	nand xordown (sdown2, smeio2, b);
	nand xorout (s12, sdown2, sup2);
	
	//--exercicio 3
	not NOT13 (sn3, a);
	nand NAND13 (sm3, sn3, b);
	nand NAND23 (s03, sm3, sm3);	
	
	initial begin	
		
	$display ( "PUC Minas - ARQ1 - Jose Fonseca - 405808 - 20/02/11" );
	$display ( "" );
	
	$display ( "Exercicio 01 - Realizar a simula��o de um operador de meia-soma" ); //-- Vers�o 1.0 - teste OK
	#1 a = 0; b = 0;
	$monitor (" %b + %b = %b %b", a, b, s01, s11);
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "PUC Minas - ARQ1 - Jose Fonseca - 405808 - 20/02/11" );
	$display ( "" );
	
	$display ( "Exercicio 02 - Realizar a simula��o de um operador de meia-soma utilizando apenas portas NAND" ); //-- Vers�o 1.0 - teste OK
	#1 a = 0; b = 0;
	$monitor (" %b + %b = %b %b", a, b, s02, s12);
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "PUC Minas - ARQ1 - Jose Fonseca - 405808 - 20/02/11" );
	$display ( "" );
	
	$display ( "Exercicio 03 - Realizar a simula��o de um operador de meia-SUBTRA��O utilizando apenas portas NAND" ); //-- Vers�o 1.0 - teste OK
	#1 a = 0; b = 0;
	$monitor (" %b - %b = %b %b", a, b, s03, s12);
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );

	end
endmodule