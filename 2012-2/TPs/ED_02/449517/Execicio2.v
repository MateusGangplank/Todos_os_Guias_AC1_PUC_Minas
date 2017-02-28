// -------------------------------------
// Exercicio0002 - OPERACOES
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- exercicio 2 ------------------
//--------------------------------------

module exercicio;
// definir dados
reg[7:0] a;
reg[7:0] b;
reg[9:0] g;
reg[8:0] i;
reg[8:0] h;
reg[6:0] sa;
reg[5:0] sb;
reg[3:0] sc;
reg[6:0] sd;
reg[8:0] se;
 

// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ana Carolina - 449517");
$display("Exercicio 2 - Executar operacoes ");

$display("\n Letra a : 101010(2) + 11011(2)");

a = 6'b101010;
b = 5'b11011;
sa = a + b ;

$display("sa = %d = %8b", sa, sa);

$display("\n Letra b :11011(2) + 25(8)");

a = 5'b11011;
b = 5'b10101;
sb = a + b;

$display("sb = %d = 10%b", sb, sb);

$display("\n Letra c : 1234(8) / 3C(16)");

g = 10'b1010011100 ;
b = 6'b111100;
sc = g / b;

$display("sc = %d = %4b", sc, sc);

$display("\n Letra d : 1BA(16) – 101110001(2)");

i = 9'b110111010;
h = 9'b101110001;
sd = i - h;

$display("sd = %d = %4b", sd, sd);

$display("\n Letra e : 25 * 32(8) + 7A(16)");

a = 8'b10001010;
b = 8'b01111010;
se = a + b;

$display("se = %d = %5b", se, se);

end
endmodule // exercicicio

