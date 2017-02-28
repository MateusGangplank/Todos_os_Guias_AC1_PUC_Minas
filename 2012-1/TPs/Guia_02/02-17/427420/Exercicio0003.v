// -------------------------
// Exercicio0003
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
$display("Exercicio0003 - Jenifer Henrique Moreira Borges - 427420");
$display("Testando operações");

a = (6'b111111 - 6'b100111) + 2'b01;
b = 5'b11111 - 5'o23 + 2'b01;
c = 5'b11111 - 23 + 2'b01;
d = 6'b111111 - 6'h2b + 2'b01;
e = 5'b11111 - 26-36 + 2'b01;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base