// ---------------------
// EXERCICIO 09 - AND
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* AND
*/
module pand ( output s, input p, input q );
//cria vinculo
assign s = (p & q);
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
wire s1, s2, s3;
//instancia
pand AND1 ( s1, a, b );
pand AND2 ( s2, c, d );
pand AND3 ( s3, s1, s2);
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
$display ( "Exercicio 009");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta AND");
$display ( "(s1 & s2) = s \n");
$monitor ( "( %b & %b ) = %b", s1, s2, s3 );
#1 a = 0; b = 1;
#1 a = 1; b = 1;
#1 a = 0; b = 0; c = 1; d = 1;
#1 a = 1; b = 1; c = 1; d = 1;
//terminar initial
end
//terminar
endmodule