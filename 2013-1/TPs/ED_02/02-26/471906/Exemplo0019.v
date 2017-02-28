// -------------------------
// Exemplo0019 - BASE
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0019 - Ana Paula - 471906");
$display("Test number system");
a = 6'b010000 + 1'b1;
b = 6'b111001 + 1'b1;
c = 5'b00110 + 1'b1;
d = 4'b0010 + 1'b1;
e = 5'b01011 + 1'b1;
$display("a= %d = %b", a, a);
$display("b= %d = %b", b, b);
$display("c= %d = %b", c, c);
$display("d= %d = %b", d, d);
$display("e= %d = %b", e, e);
end
endmodule // test_base