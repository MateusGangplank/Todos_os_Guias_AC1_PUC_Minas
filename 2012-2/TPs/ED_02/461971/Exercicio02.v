// -------------------------
// Exxercicio02 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module exercicio_01;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio02 - Herbert Alves - 461971");
$display("Test number system");
a = 'b101010 + 'b11011;
b = 'b11011 + 'o25;
c = 'o1234 / 'h3C;
d = 'h1BA - 'b101110001;
e = 'o25 * 'o32 + 'h7A;
$display("\nValores");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);



end
endmodule // test_base