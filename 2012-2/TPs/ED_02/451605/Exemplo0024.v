// -------------------------
// Exemplo0022 - BASE
// Nome: PEDRO HENRIQUE LIMA PINHEIRO
// Matricula: 451605
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [2:0] c;
reg [5:0] d;
reg [5:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0022 - PEDRO HENRIQUE LIMA PINHEIRO - 451605");
$display("Test number system");
a = ~6'b100110 + 1;
b = ~5'o24 + 1;
c = ~25 + 1;
d = ~9'h2D + 1;
e = ~(27-37) + 1 ;
$display("\nExercicio 03");
$display("a = %d = %6b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %6b", d, d);
$display("e = %d = %6b", e, e);
end
endmodule // test_base