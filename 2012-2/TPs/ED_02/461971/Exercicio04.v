// -------------------------
// Exxercicio04 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module exercicio_01;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio04 - Herbert Alves - 461971");
$display("Test number system");
a = ~'b101011 + 1;
b = ~'b111001 + 1;
c = ~'d27 + 1;
d = ~'hC + 1;
e = ~'o21 + 1;
$display("\nValores");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);



end
endmodule // test_base