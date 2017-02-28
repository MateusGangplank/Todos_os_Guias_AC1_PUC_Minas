// -----------------------------------------------------------
// Guia 08_01 - Função simplificada pelo método de Quine-McCluskey
// Nome:  Nádia de Souza Maciel Vieira Ferreira
// Matricula: 414511
// ------------------------------------------------------------------

//FAZER um circuito lógico para a função abaixo,após simplificá-la pelo método de Quine-McCluskey:

//     f ( a, b, c, d ) = SoP ( m( 2, 3, 6, 7, 10, 11, 12, 14 ) )

 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module funcao (s0, a, b, c, d);

output s0;
input a, b, c, d;
wire saida1, saida2, saida3, saida4, saida5, saida6, saida7;

not NOT1(saida1, d);
and AND1(saida2, a, b, saida1);
and AND2(saida3, c, saida1);
not NOT2(saida4, b);
and AND3(saida5, saida4, c);
not NOT3(saida6, a);
and AND4(saida7, saida6, c);
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
	$display("Guia 08 - Nádia de Souza maciel Vieira Ferreira");
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
    
     
*/
