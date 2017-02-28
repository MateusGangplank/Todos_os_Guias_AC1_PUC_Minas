// -------------------------
// Exemplo0014 - BASE
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [2:0] a;
reg [3:0] b;
reg [4:0] c;
reg [4:0] d;
// ------------------------- parte principal
initial begin
$display("Exemplo0014 - Herbert Alves - 461971");
$display("Test number system");
a = 5;
b = 10;
c = 15;
d = 20;
$display("\nPositive value");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", a, a);
$display("c = %d = %5b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("d = %d = %5o", d, d);
$display("d = %d = %5h", d, d);

a = -5;
b = -5;
c = -5;
$display("\nNegative value");
$display("a = -5 [3] = %d = %3b", a, a);
$display("b = -5 [4] = %d = %4b", b, b);
$display("c = -5 [5] = %d = %5b", c, c);

a = ~5+1;
b = ~5+1;
c = ~5+1;
$display("\nNegative mixed expression");   //complemento de 2
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);

a = 5 + 3;
b = 5 + 3;
c = 10 - 5 + 25 + 3 + 1;
$display("\nOverflow");     //acima da capacidade de representa��o
$display("a = %d = %3b", a, a);  //a=8, 1000 n�o � possivel representar com 3 bits, mostra 000
$display("b = %d = %4b", b, b);  //ok
$display("c = %d = %5b", c, c);  //a=34, 100010 precisa de 6 bits, mostra 00010
end
endmodule // test_base