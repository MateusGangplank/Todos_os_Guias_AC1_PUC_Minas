// -------------------------
// Exercicio04 - BASE
// Nome: Adamo Ludwig
// Matricula: 473319
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
$display("Exercicio04 - Adamo Ludwig - 473319");
a = ~(6'b101111)+1;
b = ~(6'b111001)+1;
c = ~(25)+1;
d = ~(6'hd)+1;
e = ~(8'o24)+1;
$display("\nNegative mixed expression");
$display("a = %d = %8b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %8b", e, e);
end
endmodule // test_base