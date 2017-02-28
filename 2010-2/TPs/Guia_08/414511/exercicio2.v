// ----------------------------------------------------------------------------------------------------------
// Guia 08_01 - Fun��o simplificada pelo m�todo de Quine-McCluskey
// Nome: N�dia de Souza Maciel Vieira Ferreira  
// Matricula: 414511
// ----------------------------------------------------------------------------------------------------------

//1) FAZER um circuito l�gico para a fun��o abaixo,ap�s simplific�-la pelo m�todo de Quine-McCluskey:

//     f ( a, b, c, d ) = SoP ( m( 2, 3, 6, 7, 10, 11, 12, 14 ) )

 
// ---------------------------------------------------------------------------------------------------

module funcao (s0, a1, b1, c1, d1);

output s0;
input a1, b1, c1, d1;
wire saida1, saida2, saida3, saida4, saida5, saida6, saida7;

not NOT1(saida1, d1);
and AND1(saida2, a1, b1, saida1);
and AND2(saida3, c1, saida1);
not NOT2(saida4, b1);
and AND3(saida5, saida4, c1);
not NOT3(saida6, a1);
and AND4(saida7, saida6, c1);
or OR1(s0, saida2, saida3, saida5, saida7);


endmodule

// ---------------------------------------------------------------------------------------------

module teste;

reg a, b, c, d;
wire s0;

funcao F1(s0, a, b, c, d);
initial begin: start

a=0;b=0;c=0;d=0;
end


initial begin: main
	$display("Guia 08 - N�dia de Souza Maciel Vieira Ferreira - Matricula: 414511");
	$display("Funcao S = abd' + cd' + b'c + a'c");
	$monitor("%b %b %b %b = %b", a, b, c, d, s0);
		
	#1 a = 0; b = 0; c = 0; d = 1;
	#1 a = 0; b = 0; c = 1; d = 0;
	#1 a = 0; b = 0; c = 1; d = 1;
	#1 a = 0; b = 1; c = 0; d = 0;
	#1 a = 0; b = 1; c = 0; d = 1;
	#1 a = 0; b = 1; c = 1; d = 0;
	#1 a = 0; b = 1; c = 1; d = 1;
	#1 a = 1; b = 0; c = 0; d = 0;
	#1 a = 1; b = 0; c = 0; d = 1;
	#1 a = 1; b = 0; c = 1; d = 0;
	#1 a = 1; b = 0; c = 1; d = 1;
	#1 a = 1; b = 1; c = 0; d = 0;
	#1 a = 1; b = 1; c = 0; d = 1;
	#1 a = 1; b = 1; c = 1; d = 0;
	#1 a = 1; b = 1; c = 1; d = 1;
	
end

endmodule

/* Resultado obtido
  
    
    Guia 08 - N�dia de Souza Maciel Vieira Ferreira - Matricula: 414511
    Funcao S = abd' + cd' + b'c + a'c
    0 0 0 0 = 0
    0 0 0 1 = 0
    0 0 1 0 = 1
    0 0 1 1 = 1
    0 1 0 0 = 0
    0 1 0 1 = 0
    0 1 1 0 = 1
    0 1 1 1 = 1
    1 0 0 0 = 0
    1 0 0 1 = 0
    1 0 1 0 = 1
    1 0 1 1 = 1
    1 1 0 0 = 1
    1 1 0 1 = 0
    1 1 1 0 = 1
    1 1 1 1 = 0
    
     ----jGRASP: operation complete.

*/
