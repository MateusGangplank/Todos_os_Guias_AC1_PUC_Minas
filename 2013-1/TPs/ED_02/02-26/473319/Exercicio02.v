// -------------------------
// Exercicio02 - BASE
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [6:0] a;
reg [9:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio02 - Adamo Ludwig - 473319");
a =  6'b100110+5'b11011;
b = 5'b11101* 6'o25;
c = 12'o1234 / 8'h4c;
d = 12'h1ba - 10'b101110011;
e = 25 * 6'o32 + 8'h8a;
$display("\nexercicio1");
$display("a = %h = %6b", a, a);
$display("b = %h = %9b", b, b);
$display("c = %h = %3b", c, c);
$display("d = %h = %6b", d, d);
$display("e = %h = %9b", e, e);
end
endmodule // test_base