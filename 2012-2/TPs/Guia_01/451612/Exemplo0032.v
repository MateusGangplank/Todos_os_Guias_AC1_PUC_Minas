// -------------------------
// Exemplo0032 - CIRCUITOS
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
* Porta AND com 4 entradas controlado por chave
*/
module pand3 ( output [3:0] s, input [3:0] a, input b );
//definir entradas e saidas
and AND1 ( s[0], a[0], b );
and AND1 ( s[1], a[1], b );
and AND1 ( s[2], a[2], b );
and AND1 ( s[3], a[3], b );
//terminar
endmodule

/**
* Criar circuito
*/
module modulos;
//criar conexao
wire [3:0] s0;
wire [3:0] s1;
wire [3:0] s2;
wire [3:0] s3;
wire [3:0] s4;
wire s5;
wire s6;
//criar registradores
reg [3:0] q;
reg [3:0] y;
reg chave;
//realizar testes
pand4 teste1 ( s0, q, y );
por4 teste2 ( s1, q, y );
buf teste3 ( s5, chave );
not teste4 ( s6, chave );
pand3 teste5 ( s2, s0, s6 );
pand3 teste6 ( s3, s1, s5 );
por4 teste7 ( s4, s2, s3 );
//atribuir valor inicial
initial begin
q = 4'b0011;
y = 4'b0101;
chave = 0;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0032");
$display ("Autor: Rodolfo Herman");
$display ("Test LU's module");
//projetar teste dos modulos
$display ("\nchave = 0 \n(AND)");
#1 $display ( "%4b & %4b\t S = %4b ", q, y, s4 );
$display ("\nchave = 1 \n(OR)");
//mudar valor da chave
chave = 1;
#1 $display ( "%4b | %4b\t S = %4b ", q, y, s4 );
//terminar initial
end
//terminar
endmodule