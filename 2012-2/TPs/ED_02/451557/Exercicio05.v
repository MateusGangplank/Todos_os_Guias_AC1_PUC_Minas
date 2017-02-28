// -------------------------
// Exercicio05 - BASE
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// test number system
// -------------------------
module Exercicio_05;
// ------------------------- definir dados
reg [8:0] a;
reg [8:0] b;
reg [8:0] c;
reg [8:0] d;
reg [8:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio05 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Exercicio05");
a = 6'b101010 + (~4'b1001 + 1);
b = 5'b11011 + (~4'o15 + 1);
c = 5'o34 + (~4'hC + 1);
d = 8'hDA + (~8'b10111001 + 1);
e = 27 + (~5'h1B + 1);
$display("\nExercicio05");
$display("a = %d = %9b", a, a);
$display("b = %d = %9b", b, b);
$display("c = %d = %9b", c, c);
$display("d = %d = %9b", d, d);
$display("e = %d = %9b", e, e);
end
endmodule // test_base