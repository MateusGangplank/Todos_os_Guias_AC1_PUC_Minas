// -------------------------
// Exercicio0011 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 1.0
// -------------------------
// -------------------------

// Exercicio 01
module Exercicio1;
//definir registradores
reg [0:4] a;
reg [0:4] b;
reg [0:2] c;
reg [0:3] d;
reg [0:4] e;

/**
* Main parte principal
*/
initial begin
//realizar operaçao
a = 2 + 14;
b = 3 * 9;
c = 32/5;
d = 24 - 11;
e = 2 * 6 + 7 - 1;

//Identificaçao
$display ( "Exercicio 011" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display ( "\nMostrar resultados \n" );
$display ( "a = %d = %5b", a, a );
$display ( "b = %d = %5b", b, b );
$display ( "c = %d = %3b", c, c );
$display ( "d = %d = %4b", d, d );
$display ( "e = %d = %5b", e, e );
//Terminar initial
end
//Terminar
endmodule

/**
* Documentação
*/

/**
* Versão 1.0
* Realizado operaçoes matematicas , mostrando no final o numero em seu formato decimal e em formato binario.
* Cada item do exercicio tem o tamanho de bits para a sua representação.
*/