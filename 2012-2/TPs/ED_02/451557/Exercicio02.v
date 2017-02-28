// -------------------------
// Exercicio02 - BASE
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// test number system
// -------------------------
module Exercicio_02;
// ------------------------- definir dados
reg [7:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [8:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio2 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Exercicio02");
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3C;
d = 9'h1BA - 9'b101110001;
e = 5'o25 * 5'o32 + 7'h7A;
$display("\nExercicio02");
$display("a) = %d = %5b", a, a);
$display("b) = %d = %3b", b, b);
$display("c) = %d = %5b", c, c);
$display("d) = %d = %5b", d, d);
$display("e) = %d = %5b", e, e);
end
endmodule // test_base