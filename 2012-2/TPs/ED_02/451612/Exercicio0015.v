// -------------------------
// Exercicio0015 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 5.0
// -------------------------
// -------------------------

// Exercicio 05
module Exercicio5;
//definir registradores
reg [0:7] a;
reg [0:7] b;
reg [0:7] c;
reg [0:7] d;
reg [0:7] e;

/**
* Main parte principal
*/
initial begin
//realizar operaçao
a = 6'b101010 + (~4'b1001 + 1);
b = 5'b11011 + (~4'o15 + 1);
c = 5'o34 + (~4'hC + 1);
d = 8'hDA + (~8'b10111001 + 1);
e = 27 + (~5'h1B + 1);

//Identificaçao
$display ( "Exercicio 015" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display ( "\nMostrar resultados \n" );
$display ( "a = %d = %8b", a, a );
$display ( "b = %d = %8b", b, b );
$display ( "c = %d = %8b", c, c );
$display ( "d = %d = %8b", d, d );
$display ( "e = %d = %8b", e, e );
//Terminar initial
end
//Terminar
endmodule

/**
* Documentação
*/

/**
* Versão 5.0
* Realizado a escrita do numero em formato binario, octal, decimal e hexadecimal ( da linguagem VERILOG )
* e realizado operaçoes matematicas em cada item, pediu-se em cada item a realizaçao da subtração de um numero pelo outro ( a - b )
* da forma que o segundo numero ( b ) seria o complemnto 2 ( C2 ) dele e assim soma-lo ao primeiro numero ( a ). A forma escrita do complemento de 2 ( C2 ) de cada numero
* foi da seguinte maneira: (~) + (numero) + (+1), poderia tambem ser escrito apenas colocando o sinal de menos ( - ) + ( numero ),
* a opção escolhida foi a primeira.
* Mostrando no final o numero em seu formato decimal e em formato binario.
* Cada item do exercicio tem o tamanho de bits para a sua representação solicitada pelo exercicio que foi de 8-bits ( 1-bity ).
*/