// -------------------------
// Exemplo0016 - BASE
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [3:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0015 - Ana Paula - 471906");
$display("Test number system");
a = 3 + 14;
b = 3 * 8;
c = 33 / 5;
d = 25 - 11;
e = 2 * 8 + 7 - 1;
$display("a= %d = %b", a, a);
$display("b= %d = %b", b, b);
$display("c= %d = %b", c, c);
$display("d= %d = %b", d, d);
$display("e= %d = %b", e, e);
end
endmodule // test_base