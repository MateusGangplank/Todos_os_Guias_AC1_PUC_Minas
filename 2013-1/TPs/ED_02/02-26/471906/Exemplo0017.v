// -------------------------
// Exemplo0017 - BASE
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// test number system
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
$display("Exemplo0017 - Ana Paula - 471906");
$display("Test number system");
a = 6'b100110 + 5'b11011;
b = 5'b11101 + 2'o25;
c = 4'o1234 / 2'h4C;
d = 3'h1BA - 9'b101110011;
e = 25 * 2'o32 + 2'h8A;
$display("a= %d = %b", a, a);
$display("b= %d = %b", b, b);
$display("c= %d = %b", c, c);
$display("d= %d = %b", d, d);
$display("e= %d = %b", e, e);
end
endmodule // test_base