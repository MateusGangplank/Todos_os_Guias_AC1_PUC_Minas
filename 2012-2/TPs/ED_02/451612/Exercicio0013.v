// -------------------------
// Exercicio0013 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 3.0
// -------------------------
// -------------------------

// Exercicio 03
module Exercicio3;
//definir registradores
reg [0:5] a;
reg [0:4] b;
reg [0:4] c;
reg [0:5] d;
reg [0:3] e;

/**
* Main parte principal
*/
initial begin
//realizar operaçao
a = ~6'b100110 + 1;
b = ~5'o24 + 1;
c = ~25 + 1;
d = ~6'h2D + 1;
e = ~(37 - 27) + 1;

//Identificaçao
$display ( "Exercicio 013" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display ( "\nMostrar resultados \n" );
$display ( "a = %d = %6b", a, a );
$display ( "b = %d = %5b", b, b );
$display ( "c = %d = %5b", c, c );
$display ( "d = %d = %6b", d, d );
$display ( "e = %d = %4b", e, e );
//Terminar initial
end
//Terminar
endmodule

/**
* Documentação
*/

/**
* Versão 3.0
* Realizado a escrita do numero em formato binario, octal, decimal e hexadecimal ( da linguagem VERILOG )
* e feito o complemnto 2 ( C2 ) de cada item do exercicio. A forma escrita do complemento de 2 ( C2 ) de cada numero
* foi da seguinte maneira: (~) + (numero) + (+1), poderia tambem ser escrito apenas colocando o sinal de menos ( - ) + ( numero ),
* a opção escolhida foi a primeira.
* Mostrando no final o numero em seu formato decimal e em formato binario.
* Cada item do exercicio tem o tamanho de bits para a sua representação.
*/