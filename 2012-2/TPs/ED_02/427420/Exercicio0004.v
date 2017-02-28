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

a = ~6'b101011 + 2'b01;
b = ~6'b111001 + 2'b01; //converti o numero 321(4) para binario
c = ~27 + 2'b01;
d = ~4'hc + 2'b01;
e = ~5'o21+ 2'b01;

$display("\nOperaçoes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base