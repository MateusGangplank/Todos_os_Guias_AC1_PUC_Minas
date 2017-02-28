// -------------------------
// Exercicio0012 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 2.0
// -------------------------
// -------------------------

// Exercicio 02
module Exercicio2;
//definir registradores
reg [0:6] a;
reg [0:5] b;
reg [0:3] c;
reg [0:6] d;
reg [0:9] e;

/**
* Main parte principal
*/
initial begin
//realizar operaçao
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3c;
d = 9'h1BA - 9'b101110001;
e = 25 * 5'o32 - 7'h7A;

//Identificaçao
$display ( "Exercicio 012" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display ( "\nMostrar resultados \n" );
$display ( "a = %d = %7b", a, a );
$display ( "b = %d = %6b", b, b );
$display ( "c = %d = %4b", c, c );
$display ( "d = %d = %7b", d, d );
$display ( "e = %d = %10b", e, e );
//Terminar initial
end
//Terminar
endmodule

/**
* Documentação
*/

/**
* Versão 2.0
* Realizado operaçoes matematicas, ultilizando a representaçao do numero em binario, octal, decimal e hexadecimal, que a linguagem
* VERILOG reconhece. Mostrando no final o numero em seu formato decimal e em formato binario.
* Cada item do exercicio tem o tamanho de bits para a sua representação.
*/