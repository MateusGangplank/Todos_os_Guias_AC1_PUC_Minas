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
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0001 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 21 - 11;
e = 2 * 6 + 7 - 1;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base