// -------------------------
// Exercicio03 - BASE
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// test number system
// -------------------------
module Exercicio_03;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [2:0] c;
reg [5:0] d;
reg [5:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio03 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Exercicio03");
a = ~6'b100110 + 1;
b = ~5'o24 + 1;
c = ~25 + 1;
d = ~9'h2D + 1;
e = ~(27-37) + 1;
$display("\nExercicio03");
$display("a) = %d = %5b", a, a);
$display("b) = %d = %3b", b, b);
$display("c) = %d = %5b", c, c);
$display("d) = %d = %5b", d, d);
$display("e) = %d = %5b", e, e);
end
endmodule // test_base