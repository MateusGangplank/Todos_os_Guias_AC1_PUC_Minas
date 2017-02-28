// -------------------------
// Exercicio 02 - BASE
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [9:0] c;
reg [6:0] d;
reg [9:0] e;
// ------------------------- parte principal
initial begin
$display(" Exercicio 02 - Yousef - 441714");
$display("Test number system");

a = 6'b101010  + 6'b11011;
b = 6'b11011 + 6'o25;
c = 10'o1234 / 6'h3C;
d = 10'h1BA - 9'b101110001;
e = 5'd25 * 5'o32 + 7'h7A;

$display("\n a = 6'b101010  + 6'b11011; \n b = 6'b11011 + 6'o25; \n c = 10'o1234 + 6'h3C; \n  d = 10'h1BA - 9'b101110001; \n e = 5'd25 * 5'o32 + 7'h7A; ");


$display("\nSoma dos Valores");
$display("a = %d = %7b", a, a);
$display("b = %d = %6b", b, b);
$display("c =  %d = %5b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);



end
endmodule // test_base