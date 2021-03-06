// -------------------------
// Exemplo0017 - BASE
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// test number system
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
$display("Exemplo0017 - Ailton Gomes - 440092");
$display("Test number system");
a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 24 - 11;
e = 2 * 6 + 7 - 1;
$display("\nOverflow");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", b, b);
$display("e = %d = %5b", c, c);
a = 6'b101010 + 5'b11011; 
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3C;
d = 9'h1BA - 9'b101110001;
e = 5'd25 * 6'o32 + 7'h7A;
$display("\nOverflow");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", b, b);
$display("e = %d = %5b", c, c);
end
endmodule // test_base