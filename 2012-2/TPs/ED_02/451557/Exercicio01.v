// -------------------------
// Exercicio01 - BASE
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// test number system
// -------------------------
module Exercicio_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Exercicio01");
a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = (24 - 11);
e = 2 * 6 + 7 - 1;
$display("\nExercicio01");
$display("a) = %d = %5b", a, a);
$display("b) = %d = %3b", b, b);
$display("c) = %d = %5b", c, c);
$display("d) = %d = %5b", d, d);
$display("e) = %d = %5b", e, e);
end
endmodule // test_base