// -------------------------
// Exemplo0033 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module modulos;
//criar conexao
wire s0;
wire s1;
wire s2;
wire s3;
wire s4;
wire s5;
wire s6;
wire s7;
wire s8;
wire s9;
wire s10;
//criar registradores
reg q;
reg y;
reg chave;
//realizar testes
and teste1  ( s0, q, y );
or teste2   ( s2, q, y );
nand teste3 ( s3, q, y );
nor teste4  ( s4, q, y );
not teste5  ( s5, chave );
buf test6   ( s6, chave );
or teste7   ( s7, s1, s2 );
or teste8   ( s8, s3, s4 );
and teste9  ( s9, s5, s7 );
and teste10 ( s10, s6, s8 );
//atribuir valor inicial
initial begin
q = 0;
y = 1;
chave = 0;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0033");
$display ("Autor: Rodolfo Herman");
$display ("Test LU's module");
//projetar teste dos modulos
$display ("\nchave = 0 \n(OR/AND)");
#1 $display ( "a = %4b\t b = %4b\t S = %4b ", q, y, s9 );
$display ( "(NOR/NAND)");
#1 $display ( "a = %4b\t b = %4b\t S = %4b ", q, y, s10 );
$display ("\nchave = 1 \n(NOR/NAND)");
//mudar valor da chave
chave = 1;
#1 $display ( "a = %4b\t b = %4b\t S = %4b ", q, y, s10 );
$display ( "(OR/AND)");
#1 $display ( "a = %4b\t b = %4b\t S = %4b ", q, y, s9 );
//terminar initial
end
//terminar
endmodule