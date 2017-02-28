// -------------------------
// Exemplo0020 - BASE
// Nome: PEDRO HENRIQUE LIMA PINHEIRO
// Matricula: 451605
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0020 - PEDRO HENRIQUE LIMA PINHEIRO - 451605");
$display("Test number system");
a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 24 - 11;
e = 2 * 6 + 7 - 1;
$display("\nExercicio 01");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base