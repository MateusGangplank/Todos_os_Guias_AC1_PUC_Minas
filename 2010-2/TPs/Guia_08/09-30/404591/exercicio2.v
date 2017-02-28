// ---------------------
// Guia 08_02 - Função simplificada pelo método de Quine-McCluskey
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// ---------------------

//FAZER um circuito lógico para a função abaixo,após simplificá-la pelo método de Quine-McCluskey:

//          f ( a, b, c, d ) = SoP ( m( 0, 2, 4, 8, 9, 11, 13 ) )

 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module funcao (s1, a, b, c, d);

output s1;
input a, b, c, d;
wire saida1, saida2, saida3, saida4, saida5, saida6, saida7, saida8, saida9;

not NOT1(saida1, a);
not NOT2(saida2, b);
not NOT3(saida3, c);
not NOT4(saida4, d);

and AND1(saida5, saida1, saida2, saida4);
and AND2(saida6, saida1, saida3, saida4);
and AND3(saida7, saida2, saida3, saida4);
and AND4(saida8, a, saida2, d);
and AND5(saida9, a, saida3, d);

or OR1(s1, saida5, saida6, saida7, saida8, saida9);

endmodule

// ---------------------------------------------------------------------------------------------

module teste;

reg a, b, c, d;
wire s1;

funcao F2(s1, a, b, c, d);
initial begin: start

a=0;b=0;c=0;d=0;
end


initial begin: main
	$display("Guia 08 - Marcia Cibele Martins Carneiro - 404591");
	$display("Funcao S = a'b'c'd'+ a'b'cd' + a'bc'd' + ab'c' + ab'd + ac'd");
	$monitor("%b %b %b %b = %b", a, b, c, d, s1);
		
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

     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio2.vvp
    
    Guia 08 - Marcia Cibele Martins Carneiro - 404591
    Funcao S = a'b'c'd'+ a'b'cd' + a'bc'd' + ab'c' + ab'd + ac'd
    0 0 0 0 = 1
    0 0 0 1 = 0
    0 0 1 0 = 1
    0 0 1 1 = 0
    0 1 0 0 = 1
    0 1 0 1 = 0
    0 1 1 0 = 0
    0 1 1 1 = 0
    1 0 0 0 = 1
    1 0 0 1 = 1
    1 0 1 0 = 0
    1 0 1 1 = 1
    1 1 0 0 = 0
    1 1 0 1 = 1
    1 1 1 0 = 0
    1 1 1 1 = 0
    
     ----jGRASP: operation complete.


*/
