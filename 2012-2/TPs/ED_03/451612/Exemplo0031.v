// -------------------------
// Exemplo0031 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Porta AND 4 entradas e saidas
*/
module pand4 ( output [3:0] s, input [3:0] a, input [3:0] b );
//definir entradas e saidas
and AND1 ( s[0], a[0], b[0] );
and AND2 ( s[1], a[1], b[1] );
and AND3 ( s[2], a[2], b[2] );
and AND4 ( s[3], a[3], b[3] );
//terminar
endmodule

/**
* Porta OR 4 entradas e saidas
*/
module por4 ( output [3:0] s, input [3:0] a, input [3:0] b );
//definir entradas e saidas
or OR1 ( s[0], a[0], b[0] );
or OR2 ( s[1], a[1], b[1] );
or OR3 ( s[2], a[2], b[2] );
or OR4 ( s[3], a[3], b[3] );
//terminar
endmodule

/**
* Testar portas
*/
module modulos;
//criar registradores
reg [3:0] x;
reg [3:0] y;
//criar conexao
wire [3:0] z;
wire [3:0] p;
//realizar testes
pand4 teste1 (z, x, y);
por4 teste2  (p, x, y);
//atribuir valor inicial
initial begin
x = 4'b0011;
y = 4'b0101;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identificaçoes
$display ("Exemplo 0031");
$display ("Autor: Rodolfo Herman");
$display ("Test LU's module");
//projetar teste dos modulos
$display ("\nAND");
#1 $display ("%4b %4b %4b", x, y, z);
$display ("\nOR");
#1 $display ("%4b %4b %4b", x, y, p);
//terminar initial
end
//terminar
endmodule