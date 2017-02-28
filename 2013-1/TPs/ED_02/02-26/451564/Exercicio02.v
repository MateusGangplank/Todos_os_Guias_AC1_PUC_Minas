// -------------------------
// Exemplo0011 - BASE
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [7:0] c;
reg [2:0] d;
reg [3:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Guilherme Augusto Bueno Borba - 451564");
$display("Test number system");
a = 'b100110 + 'b11011;
b = 'b11101 + 'o25;
c = 'o1234 + 'h4c;
d = 'h1ba - 'b101110011;
e = 'o25 * 'o32 + 'h8a;
$display("\nPositive value");
$display("a = %d = %7b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %8b", c, c);
$display("d = %d = %3b", d, d);
$display("e = %d = %4b", e, e);
end
endmodule // test_base