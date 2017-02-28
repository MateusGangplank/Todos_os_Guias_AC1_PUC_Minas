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
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0022 - PEDRO HENRIQUE LIMA PINHEIRO - 451605");
$display("Test number system");
a = ~6'b101011 + 1;
b = ~6'b111001 + 1;
c = ~27 + 1;
d = ~4'hC + 1;
e = ~5'o21 + 1 ;
$display("\nExercicio 04");
$display("a = %d = %8b", a, a);
$display("b = %d = %7b", b, b);
$display("c = %d = %6b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %8b", e, e);
end
endmodule // test_base