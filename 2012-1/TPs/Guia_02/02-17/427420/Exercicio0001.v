// -------------------------
// Exercicio0001
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [4:0] c;
reg [4:0] d;
reg [5:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0001 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = 2 + 15;
b = 3 * 8;
c = 32 / 3;
d = 21 - 11;
e = 2 * 5 + 6 - 1;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base