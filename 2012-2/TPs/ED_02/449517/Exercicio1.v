// -------------------------------------
// Exercicio0001 - OPERACOES
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- exercicio 1 ------------------
//--------------------------------------

module exercicio;
// definir dados
reg[5:0] a;
reg[5:0] b;
reg[4:0] sa;
reg[3:0] sb;
reg[2:0] sc;
reg[5:0] sd;
reg[5:0] se;
 

// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ana Carolina - 449517");
$display("Exercicio 1 - Executar operacoes ");

$display("\n Letra a :");

a = 2;
b = 14;
sa = a + b ;

$display("sa = %d = %5b", sa, sa);

$display("\n Letra b :");

a = 3;
b = 9;
sb = a * b;

$display("sb = %d = %5b", sb, sb);

$display("\n Letra c :");

a = 32;
b = 5;
sc = 32/5;

$display("sc = %d = %3b", sc, sc);

$display("\n Letra d :");

a = 24;
b = 11;
sd = 24 +(~11 + 1);

$display("sd = %d = %4b", sd, sd);

$display("\n Letra e :");

a = 2 * 6;
b = 7 - 1;
se = a + b;

$display("se = %d = %5b", se, se);

end
endmodule // exercicicio