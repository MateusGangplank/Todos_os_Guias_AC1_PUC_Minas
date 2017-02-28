// ---------------------
// EXERCICIO 10 - OR
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* OR
*/
module por ( output s, input p, input q );
//cria vinculo
assign s = (p | q);
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
por OR1 ( s1, a, b );
por OR2 ( s2, c, d );
por OR3 ( s3, s1, s2);
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
$display ( "Exercicio 010");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta OR");
$display ( "(s1 | s2) = s \n");
$monitor ( "( %b | %b ) = %b", s1, s2, s3 );
#1 a = 0; b = 1;
#1 a = 1; b = 1;
#1 a = 0; b = 0; c = 1; d = 1;
#1 a = 1; b = 1; c = 1; d = 1;
//terminar initial
end
//terminar
endmodule