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
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio04 - Herbert Alves - 461971");
$display("Test number system");
a = 'b101010 + ~'b1001 + 1;
b = 'b11011 + ~'o15 + 1;
c = 'o34 + ~'hC + 1;
d = 'hDA + ~'b10111001 + 1;
e = 'd27 + ~'h1B + 1;
$display("\nValores");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);



end
endmodule // test_base