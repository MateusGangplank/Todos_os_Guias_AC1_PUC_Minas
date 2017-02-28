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
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0022 - PEDRO HENRIQUE LIMA PINHEIRO - 451605");
$display("Test number system");
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3C;
d = 9'h1BA - 9'b101110001;
e = 5'o25 * 5'o32 + 7'h7A ;
$display("\nExercicio 02");
$display("a = %d = %7b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %4b", c, c);
$display("d = %d = %6b", d, d);
$display("e = %d = %8b", e, e);
end
endmodule // test_base