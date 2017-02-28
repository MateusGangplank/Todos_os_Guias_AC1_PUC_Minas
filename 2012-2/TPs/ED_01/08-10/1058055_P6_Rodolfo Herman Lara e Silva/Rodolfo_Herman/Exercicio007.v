// ---------------------
// EXERCICIO 07 - XNOR
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* XNOR
*/
module pxnor ( output s, input p, input q );
//cria vinculo
assign s = ((p&q) | ((~p)&(~q)));
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
pxnor XNOR2 ( s, a, b );
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
//identificaçao
$display ( "Exercicio 007");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta XNOR");
$display ( "( ab + a'b') \t= s \n");
$monitor ( "( %b  &  %b ) \t= %b", a, b, s );
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
//terminar initial
end
//terminar
endmodule