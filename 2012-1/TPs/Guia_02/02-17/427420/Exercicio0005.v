// -------------------------
// Exercicio0004
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [8:0] a;
reg [7:0] b;
reg [6:0] c;
reg [5:0] d;
reg [8:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0004 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = 6'b111111 - 6'b101010 - 4'b1101 + 2'b01;
b = 4'b1111 - 5'b11010 - 4'o15 + 2'b01;
c = 5'b11111 - 5'o34 - 4'hb + 2'b01;
d = 8'b11111111 - 8'hca - 8'b10111001 + 2'b01;
e = 5'b11111 - 25 - 5'h1a + 2'b01;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base