// ---------------------
// EXERCICIO 01 - NAND
// Nome: Rodolfo Herman
// Matricula: 451612
// ---------------------

/**
* NAND
*/
module pnand ( output s, input p, input q );
//cria vinculo
assign s = (~p | ~q);
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
pnand NAND2 ( s, a, b );
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
$display ( "Exercicio 004");
$display ( "Autor: Rodolfo Herman");
$display ( "Testar porta NAND");
$display ( "(~a | ~b) = s \n");
#1 $display ( "(~%b | ~%b) = %b", a, b, s );
a = 0; b = 1;
#1 $display ( "(~%b | ~%b) = %b", a, b, s );
a = 1; b = 0;
#1 $display ( "(~%b | ~%b) = %b", a, b, s );
a = 1; b = 1;
#1 $display ( "(~%b | ~%b) = %b", a, b, s );
//terminar initial
end
//terminar
endmodule