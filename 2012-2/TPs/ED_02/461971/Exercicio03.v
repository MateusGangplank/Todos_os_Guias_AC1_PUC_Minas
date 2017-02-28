// -------------------------
// Exxercicio03 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module exercicio_01;
// ------------------------- definir dados
reg [5:0] a;
reg [3:0] b;
reg [2:0] c;
reg [4:0] d;
reg [3:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio03 - Herbert Alves - 461971");
$display("Test number system");
a = ~'b100110 +1;
b = ~'o24 + 1;
c = ~'d25 + 1;
d = ~'h2D + 1;
e = ~(27 - 37) + 1;
$display("\nValores");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);



end
endmodule // test_base