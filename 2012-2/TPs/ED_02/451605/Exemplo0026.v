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
reg [8:0] a;
reg [8:0] b;
reg [8:0] c;
reg [8:0] d;
reg [9:0] e;
reg [8:0] a1;
reg [8:0] b1;
reg [8:0] c1;
reg [8:0] d1;
reg [8:0] e1;

// ------------------------- parte principal
initial begin
$display("Exemplo0022 - PEDRO HENRIQUE LIMA PINHEIRO - 451605");
$display("Test number system");

a1 = ~4'b1001 + 1;
b1 = ~4'o15 + 1;
c1 = ~4'hC + 1;
d1 = ~8'b10111001 + 1;
e1 = ~5'h1B + 1;

a = 6'b101010 + a1;
b = 5'b11011 + b1;
c = 5'o34 + c1;
d = 8'hDA + d1;
e = 27 + e1;
$display("\nExercicio 05");
$display("a = %d = %9b", a, a);
$display("b = %d = %9b", b, b);
$display("c = %d = %9b", c, c);
$display("d = %d = %9b", d, d);
$display("e = %d = %9b", e, e);
end
endmodule // test_base