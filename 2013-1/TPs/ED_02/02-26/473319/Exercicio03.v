// -------------------------
// Exercicio03 - BASE
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [5:0] c;
reg [6:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio03 - Adamo Ludwig - 473319");
a = ~(6'b101010)+1;
b = ~(6'o25)+1;
c = ~(27)+1;
d = ~(6'h2c)+1;
e = ~(25-35)+1;
$display("\nNegative mixed expression");
$display("a = %d = %5b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %6b", d, d);
$display("e = %d = %4b", e, e);
end
endmodule // test_base