// ---------------------
// EXERCICIO 06 - XOR
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* XOR
*/
module pxor ( output s, input p, input q );
//cria vinculo
assign s = (~(p)&q | p&~(q));
//terminar
endmodule

/**
* Testar porta
*/
module testador;
//criar entradas
reg a;
reg b;
//criar FIO
wire s;
//instancia
pxor XOR1 ( s, a, b );
//atribuir valor inicial
initial begin
a = 0;
b = 0;
//terminar initial
end

/**
* Main - parte principal
*/
initial begin
//identifica�ao
$display ( "Exercicio 006");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta XOR");
$display ( "(a'b + ab') \t= s \n");
$monitor ( "( %b  &  %b ) \t= %b", a, b, s );
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
//terminar initial
end
//terminar
endmodule