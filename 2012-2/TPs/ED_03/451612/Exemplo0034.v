// -------------------------
// Exemplo0034 - CIRCUITOS
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

/**
* Criar circuito
*/
module modulos;
//criar conexao
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14;
//criar registradores
reg a;
reg b;
reg [0:1] chave;
//realizar testes
or teste1    ( s0, a, b );
nor teste2   ( s1, a, b );
xor teste3   ( s2, a, b );
xnor teste4  ( s3, a, b );
not teste5   ( s4, chave [0] );
not teste6   ( s5, chave [1] );
buf teste7   ( s6, chave [0] );
buf teste8   ( s7, chave [1] );
and teste9   ( s8, s0, s4, s5 );
and teste10  ( s9, s1, s7, s4 );
and teste11  ( s10, s2, s5, s6 );
and teste12  ( s11, s3, s7, s6 );
or teste13   ( s12, s8, s9 );
or teste14   ( s13, s10, s11 );
or teste15   ( s14, s12, s13 );
//atribuir valor inicial
initial begin
a = 1;
b = 1;
chave = 2'b00;
//terminar initial
end

/**
* Parte principal
*/
initial begin
//Identidicaçao
$display ("Exemplo 0034");
$display ("Autor: Rodolfo Herman");
$display ("Test LU's module");
//projetar teste dos modulos
$display ("\nchave = 00 \n(Porta OR)");
#1 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s14 );
//mudar valor da chave
chave = 2'b01;
a = 0;
b = 0;
$display ("\nchave = 01 \n(Porta NOR)");
#1 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s14 );
chave = 2'b10;
b = 1;
$display ("\nchave = 10 \n(Porta XOR)");
#1 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s14 );
chave = 2'b11;
a = 1;
$display ("\nchave = 11 \n(Porta XNOR)");
#1 $display ( "a = %4b\t  b = %4b\t S = %4b ", a, b, s14 );
//terminar initial
end
//terminar
endmodule
