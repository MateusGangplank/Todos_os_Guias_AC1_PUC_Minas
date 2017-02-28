// -------------------------
// Exxercicio01 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module exercicio_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Herbert Alves - 461971");
$display("Test number system");
a = 2+14;
b = 3*9;
c = 32/5;
d = 24-11;
e = 2*6+7-1;
$display("\nValores");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);



end
endmodule // test_base