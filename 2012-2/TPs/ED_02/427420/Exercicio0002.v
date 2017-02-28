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
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0002 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = 6'b101010 + 5'b11011;
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3c;
d = 9'h1ba - 9'b101110001;
e = 25 * 5'o32 + 7'h7a;

$display("\nOperaçoes segundo exercicio");
$display("a = %d = %7b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %4b", c, c);
$display("d = %d = %7b", d, d);
$display("e = %d = %10b", e, e);
end
endmodule // test_base