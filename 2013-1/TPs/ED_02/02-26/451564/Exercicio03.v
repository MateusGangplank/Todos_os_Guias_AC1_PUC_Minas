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
reg [4:0] a;
reg [4:0] b;
reg [4:0] c;
reg [9:0] d;
reg [5:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Guilherme Augusto Bueno Borba - 451564");
$display("Test number system");
a = ~'b01010+1;
b = ~'o25+'b1;
c = ~'b11011+1;
d = ~'h2c+1;
e = ~(25-35)+1;
$display("\nPositive value");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %10b", d, d);
$display("e = %d = %6b", e, e);
end
endmodule // test_base