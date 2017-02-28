// -------------------------
// Exemplo0018 - BASE
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [5:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0018 - Ana Paula - 471906");
$display("Test number system");
a = 6'b010101 + 1'b1;
b = 5'b01010 + 1'b1;
c = 5'b00100 + 1'b1;
d = 6'b010011 + 1'b1;
e = 6'b011001 + 6'b011101 +1'b1;
$display("a= %d = %b", a, a);
$display("b= %d = %o", b, b);
$display("c= %d = %d", c, c);
$display("d= %d = %h", d, d);
$display("e= %d = %d", e, e);
end
endmodule // test_base