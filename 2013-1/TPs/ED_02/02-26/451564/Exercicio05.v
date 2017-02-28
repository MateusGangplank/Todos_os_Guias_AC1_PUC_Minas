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
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Guilherme Augusto Bueno Borba - 451564");
$display("Test number system");
a='b101011 + (~'b1001+1);
b='b10011 + (~'o15+1);
c='o35 + (~'hC+1);
d='hBA + (~'b10111001+1);
e='d37 + (~'h1b+1);
$display("\nPositive value");
$display("a = %d = %8b", a, a);
$display("b = %d = %8b", b, b);
$display("c = %d = %8b", c, c);
$display("d = %d = %8b", d, d);
$display("e = %d = %8b", e, e);
end
endmodule // test_base