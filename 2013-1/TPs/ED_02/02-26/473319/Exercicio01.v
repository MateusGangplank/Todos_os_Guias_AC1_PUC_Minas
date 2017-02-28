// -------------------------
// Exercicio01 - BASE
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [4:0] c;
reg [4:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Adamo Ludwig - 473319");
a = 3 + 14;
b = 3*8;
c = 33 / 5;
d = 25-11;
e = 2 * 8 + 7 - 1;
$display("\nexercicio1");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base