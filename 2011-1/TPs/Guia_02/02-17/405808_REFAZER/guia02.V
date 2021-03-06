//-- Programa para a Disciplina Arquitetura de Computadores I
//-- Pont�fica Universidade Cat�lica de Minas Gerais - PUC Minas
//-- Aluno : Jos� Ferreira Reis Fonseca - Matr�cula 405808
//-- Atividade Guia 01


//-------- GUIA 02 - TOTALIDADE DO PROGRAMA - VERS�O 0.1 - 17/02/2011

module EXS;
	
	reg a, b, c, s;

	initial begin	
	
	a = 1; b = 1; c = 0; s = 0;
	s = ( ~ ( a && b && c));
	$display ( "PUC Minas - ARQ1 - Jose Fonseca - 405808 - 10/02/11" );
	$display ( "" );
	
	$display ( "Exercicio 01 - exiba a tabela-verdade de uma porta OR de 2 Entradas" ); //-- Vers�o 1.0 - teste imposs�vel
	$monitor (" %b || %b = %b", a, b, s);
	#1 a = 0; b = 0; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 0; b = 1; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 0; b = 1; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 1; b = 0; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 1; b = 0; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 1; b = 1; s = ( ~ (~(a && a) && ~(b && b)));
	#1 a = 1; b = 1; s = ( ~ (~(a && a) && ~(b && b)));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "Exercicio 02 - exibir a tabela_verdade para a porta AND  com 2 entradas" ); //-- Vers�o 1.0 - teste imposs�vel
	a = 0; b = 0; c = 0; s = 0;	
	$monitor (" %b && %b = %b", a, b, s);
	#1 a = 0; b = 0; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 0; b = 1; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 0; b = 1; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 1; b = 0; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 1; b = 0; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 1; b = 1; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 a = 1; b = 1; s = ( ~ ( (~(a || a) || ~(b ||b))));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	$display ( "Exercicio 03 - exibir a tabela_verdade para a porta NOT  com 1 entradas" ); //-- Vers�o 1.0 - teste imposs�vel
	a = 0; b = 0; c = 0; s = 0;	
	$monitor (" ~ %b  = %b", a, s);
	#1 a = 0; s = ( ~(a && a));
	#1 a = 1; s = ( ~(a && a));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	//----------------------------EXERCICIOS EXTRAS
	
	$display ( "Exercicio 04 - exibir a tabela_verdade para a porta NOR  com 2 entradas" ); //-- Vers�o 1.0 teste imposs�vel
	a = 0; b = 0; s = 1;	
	$monitor (" %b ~|| %b = %b", a, b, s);
	#1 a = 0; b = 1; s = (  ~((~(a && a) && ~(b && b)) && (~(a && a) && ~(b && b))));
	#1 a = 1; b = 0; s = (  ~((~(a && a) && ~(b && b)) && (~(a && a) && ~(b && b))));
	#1 a = 1; b = 1; s = (  ~((~(a && a) && ~(b && b)) && (~(a && a) && ~(b && b))));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );

	$display ( "Exercicio 05 - exibir a tabela_verdade para a porta NAND  com 2 entradas - tipo2" ); //-- Vers�o 1.0 teste imposs�vel
	a = 0; b = 0; s = 1;	
	$monitor (" %b ~|| %b = %b", a, b, s);
	#1 a = 0; b = 1; s = (~(( ~ ( (~(a || a) || ~(b ||b)))) || ( ~ ( (~(a || a) || ~(b ||b))))));
	#1 a = 1; b = 0; s = (~(( ~ ( (~(a || a) || ~(b ||b)))) || ( ~ ( (~(a || a) || ~(b ||b))))));
	#1 a = 1; b = 1; s = (~(( ~ ( (~(a || a) || ~(b ||b)))) || ( ~ ( (~(a || a) || ~(b ||b))))));
	#1 $display ( "" );
	$display ( "FIM DA TABELA -----------------------------------" );
	#1 $display ( "" );
	
	end
	
endmodule
	
	// OBS.: TENTE DEFINIR OS MODULOS.
	//       EVITE A PROGRAMACAO CONVENCIONAL. 
	//       PROGRAMAR EM VERILOG E' MAIS DECLARATIVO DO QUE PROCEDIMENTAL.
	//       EXPERIMENTE!
	