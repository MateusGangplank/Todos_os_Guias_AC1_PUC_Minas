//-- Programa para a Disciplina Arquitetura de Computadores I
//-- Pontífica Universidade Católica de Minas Gerais - PUC Minas
//-- Aluno : José Ferreira Reis Fonseca - Matrícula 405808
//-- Atividade Guia 01


//-------- GUIA 01 - TOTALIDADE DO PROGRAMA - VERSÃO 0.3 - 10/02/2011

//--EXERCICIOS
//--01.) Construir a tabela-verdade para a porta NAND com 3 entradas.

module EX1;
	
	reg a, b, c, s;

	initial begin	
	
	a = 0; b = 0; c = 0; s = 0;
	s = ( ~ ( a && b && c));
	$display ( "PUC Minas - ARQ1 - Jose Fonseca - 405808 - 10/02/11" );
	$display ( "" );
	
	$display ( "Exercicio 01 - exiba a tabela-verdade de uma porta NAND de 3 Entradas" ); //-- Versão 1.0 - teste OK
	$monitor (" %b ~^ %b ~^ %b = %b", a, b, c, s);
	#1 a = 0; b = 0; c = 1; s = ( ~ ( (a && b) && c));
	#1 a = 0; b = 1; c = 0; s = ( ~ ( (a && b) && c));
	#1 a = 0; b = 1; c = 1; s = ( ~ ( (a && b) && c));
	#1 a = 1; b = 0; c = 0; s = ( ~ ( (a && b) && c));
	#1 a = 1; b = 0; c = 1; s = ( ~ ( (a && b) && c));
	#1 a = 1; b = 1; c = 0; s = ( ~ ( (a && b) && c));
	#1 a = 1; b = 1; c = 1; s = ( ~ ( (a && b) && c));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "Exercicio 02 - exibir a tabela_verdade para a porta NOR  com 3 entradas" ); //-- Versão 1.0 - teste OK
	a = 0; b = 0; c = 0; s = 1;	
	$monitor (" %b ~| %b ~| %b = %b", a, b, c, s);
	#1 a = 0; b = 0; c = 1; s = ( ~ ( (a || b) || c));
	#1 a = 0; b = 1; c = 0; s = ( ~ ( (a || b) || c));
	#1 a = 0; b = 1; c = 1; s = ( ~ ( (a || b) || c));
	#1 a = 1; b = 0; c = 0; s = ( ~ ( (a || b) || c));
	#1 a = 1; b = 0; c = 1; s = ( ~ ( (a || b) || c));
	#1 a = 1; b = 1; c = 0; s = ( ~ ( (a || b) || c));
	#1 a = 1; b = 1; c = 1; s = ( ~ ( (a || b) || c));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "Exercicio 03 - exibir a tabela_verdade para a porta XNOR  com 3 entradas" ); //-- Versão 1.0 - teste ulTImo valor da tabela em fail
	a = 0; b = 0; c = 0; s = 1;	
	$monitor (" %b ~^ %b ~^ %b = %b", a, b, c, s);
	#1 a = 0; b = 0; c = 1; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 0; b = 1; c = 0; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 0; b = 1; c = 1; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 1; b = 0; c = 0; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 1; b = 0; c = 1; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 1; b = 1; c = 0; s = ( ~ ( a ^^ b ^^ c));
	#1 a = 1; b = 1; c = 1; s = ( ~ ( a ^^ b ^^ c));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	//----------------------------EXERCICIOS EXTRAS
	
	$display ( "Exercicio 04 - exibir a tabela_verdade para a porta XOR  com 2 entradas" ); //-- Versão 1.0 teste ok
	a = 0; b = 0; s = 0;	
	$monitor (" %b x^ %b = %b", a, b, s);
	#1 a = 0; b = 1; s = (  (( a ^^ b )));
	#1 a = 1; b = 0; s = (  (( a ^^ b )));
	#1 a = 1; b = 1; s = (  (( a ^^ b )));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );

	$display ( "Exercicio 05 - exibir a tabela_verdade para a porta XOR  com 2 entradas - tipo2" ); //-- Versão 1.0 teste ok
	a = 0; b = 0; s = 0;	
	$monitor (" %b x^ %b = %b", a, b, s);
	#1 a = 0; b = 1; s = ( (~a&b | a&~b) );
	#1 a = 1; b = 0; s = ( (~a&b | a&~b) );
	#1 a = 1; b = 1; s = ( (~a&b | a&~b) );
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	end
	
endmodule

// OBS.: É PARA DEFINIR O MODULO E FAZER TESTES DO MESMO
//       TENTE DE NOVO.

	