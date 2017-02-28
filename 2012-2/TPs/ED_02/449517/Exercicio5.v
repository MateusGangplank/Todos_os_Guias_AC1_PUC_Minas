// -------------------------------------
// Exercicio0005 - OPERACOES
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- exercicio 5 ------------------
//--------------------------------------

module exercicio;
// definir dados
reg[7:0] a;
reg[7:0] b;
reg[8:0] g;
reg[8:0] h;
reg[5:0] sa;
reg[3:0] sb;
reg[4:0] sc;
reg[8:0] sd;
reg[7:0] se;
 

// ------------------------- parte principal
initial begin
$display(" Ana Carolina - 449517");
$display("Exercicio 5 - Executar operacoes ");

$display("\n Letra a : 101010(2) – 1001(2)");

a = 6'b101010;
b = 6'b001001;
sa = a +(~b+1) ;

$display("sa = %d = %8b", sa, sa);

$display("\n Letra b : 11011(2) – 15(8)");

a = 5'b11011;
b = 5'b01101;
sb = a +(~b+1);

$display("sb = %d = %4b", sb, sb);

$display("\n Letra c : 34(8) – C(16)");

a = 5'b11100 ;
b = 5'b01100;
sc = a +(~b+1);

$display("sc = %d = %5b", sc, sc);

$display("\n Letra d :DA(16) – 10111001(2) ");

g = 9'b011011010;
h = 9'b101110001;
sd = g +(~h+1);

$display("sd = %d = %10b", sd, sd);

$display("\n Letra e : 27 – 1B(16)");

a = 5'b11011;
b = 5'b11011;
se = a +(~b+1);

$display("se = %d = %7b", se, se);

end
endmodule // exercicicio

