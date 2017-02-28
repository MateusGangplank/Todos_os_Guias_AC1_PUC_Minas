// -------------------------
// Exercicio0014 - OPERAÇÕES
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 4.0
// -------------------------
// -------------------------

// Exercicio 04
module Exercicio4;
//definir registradores
reg [0:7] a;
reg [0:6] b;
reg [0:5] c;
reg [0:4] d;
reg [0:7] e;

/**
* Main parte principal
*/
initial begin
//realizar operaçao
a = ~6'b101011 + 1;
b = ~6'o75 + 1;
c = ~27 + 1;
d = ~4'hC + 1;
e = ~5'o21 + 1;

//Identificaçao
$display ( "Exercicio 014" );
$display ( "Autor : Rodolfo Herman - 451612" );
$display ( "\nMostrar resultados \n" );
$display ( "a = %d = %8b", a, a );
$display ( "b = %d = %7b", b, b );
$display ( "c = %d = %6b", c, c );
$display ( "d = %d = %5b", d, d );
$display ( "e = %d = %8b", e, e );
//Terminar initial
end
//Terminar
endmodule

/**
* Documentação
*/

/**
* Versão 4.0
* Realizado a escrita do numero em formato binario, octal, decimal e hexadecimal ( da linguagem VERILOG )
* e feito o complemnto 2 ( C2 ) de cada item do exercicio. A forma escrita do complemento de 2 ( C2 ) de cada numero
* foi da seguinte maneira: (~) + (numero) + (+1), poderia tambem ser escrito apenas colocando o sinal de menos ( - ) + ( numero ),
* a opção escolhida foi a primeira.
* Mostrando no final o numero em seu formato decimal e em formato binario.
* Cada item do exercicio tem o tamanho de bits para a sua representação de acordo com o que o exercicio pediu nos comentarios.
*/