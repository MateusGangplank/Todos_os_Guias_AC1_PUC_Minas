// -------------------------------------
// Exercicio0003 - COMPLEMENTO 2
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- exercicio 3 ------------------
//--------------------------------------

module exercicio;
// definir dados
reg[5:0] a;
reg[4:0] b;
reg[4:0] c;
reg[5:0] d;
reg[3:0] e;
reg[5:0] sa;
reg[4:0] sb;
reg[4:0] sc;
reg[5:0] sd;
reg[7:0] se;
 

// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ana Carolina - 449517");
$display("Exercicio 4 - Complemento 2 ");

$display("\n Letra a :");

a = 6'b100110;
sa = ~a+1 ;

$display("sa = %d = %6b", sa, sa);

$display("\n Letra b :");

b = 5'b10100;

sb = ~b+1;

$display("sb = %d = %5b", sb, sb);

$display("\n Letra c :");

c = 5'b11001;
sc = ~c+1;

$display("sc = %d = %5b", sc, sc);

$display("\n Letra d :");

d = 6'b101101;
sd = ~d+1;

$display("sd = %d = %6b", sd, sd);

$display("\n Letra e :");

e = -10;
se = ~e+1;

$display("se = %d = %4b", se, se);

end
endmodule // exercicicio

