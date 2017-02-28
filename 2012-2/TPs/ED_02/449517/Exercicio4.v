// -------------------------------------
// Exercicio0004 - COMPLEMENTO 2
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- exercicio 4 ------------------
//--------------------------------------

module exercicio;
// definir dados
reg[7:0] a;
reg[6:0] b;
reg[5:0] c;
reg[4:0] d;
reg[7:0] e;
reg[7:0] sa;
reg[6:0] sb;
reg[5:0] sc;
reg[4:0] sd;
reg[7:0] se;
 

// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ana Carolina - 449517");
$display("Exercicio 4 - Complemento 2 ");

$display("\n Letra a :");

a = 8'b00101011;
sa = ~a+1 ;

$display("sa = %d = %7b", sa, sa);

$display("\n Letra b :");

b = 7'b0111001;

sb = ~b+1;


$display("sb = %d = %6b", sb, sb);

$display("\n Letra c :");

c = 6'b011011;
sc = ~c;

$display("sc = %d = %6b", sc, sc);

$display("\n Letra d :");

d = 5'b01100;
sd = ~d;

$display("sd = %d = %4b", sd, sd);

$display("\n Letra e :");

e = 8'b00010001;
se = ~e;

$display("se = %d = %5b", se, se);

end
endmodule // exercicicio

