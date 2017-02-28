// ---------------------
// EXERCICIO 08 - AND
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* AND
*/
module pand ( output s, input p, input q, input e, input f );
//cria vinculo
assign s = (p & q & e & f);
//terminar
endmodule

/**
* Testar porta
*/
module testador;
//criar entradas
reg a;
reg b;
reg c;
reg d;
//criar FIO
wire s;
//instancia
pand AND2 ( s, a, b, c, d );
//atribuir valor inicial
initial begin
a = 0;
b = 0;
c = 0;
d = 0;
//terminar initial
end

/**
* Main - parte principal
*/
initial begin
//identificaçao
$display ( "Exercicio 008");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta AND");
$display ( "(a & b & c & d) = s \n");
$monitor ( "(%b   %b   %b   %b) = %b", a, b, c, d, s );
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
//terminar initial
end
//terminar
endmodule