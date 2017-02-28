// -------------------------
// Exercicio 01 - BASE
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display(" Exercicio 01 - Yousef - 441714");
$display("Test number system");

a = 2+14;
b = 3*9;
c = 32/5;
d = 24-11;
e = 2*6+7-1;

$display("\nSoma dos Valores");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c =  %d = %5b", c, c);
$display("b = %d = %4b", d, d);
$display("e = %d = %5b", e, e);



end
endmodule // test_base