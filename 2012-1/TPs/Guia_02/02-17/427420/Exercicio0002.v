// -------------------------
// Exercicio0002
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;

// ------------------------- definir dados
reg [6:0] a;
reg [6:0] b;
reg [6:0] c;
reg [6:0] d;
reg [6:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0002 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = 6'b101010 + 5'b11010;
b = 5'b11010 + 6'o25;
c = 10'o1234 / 6'h2b;
d = 10'h1ca - 9'b101110001;
e = 25 * 5'o31 + 7'h7a;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base