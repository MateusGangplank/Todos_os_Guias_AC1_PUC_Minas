// -------------------------
// Exemplo0020 - BASE
// Nome: Ana Paula da Silva
// Matricula: 471906
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [8:0] d;//nao coube em apenas 8bits
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0020 - Ana Paula - 471906");
$display("Test number system");
a = 6'b101011 + 4'b0111 + 1'b1;
b = 5'b10011 + 4'b0011 + 1'b1;
c = 5'b11101 + 4'b0100 + 1'b1;
d = 8'b10111010 + 8'b01000111 + 1'b1;
e = 6'b100101 + 5'b00101 + 1'b1;
$display("a= %d = %b", a, a);
$display("b= %d = %b", b, b);
$display("c= %d = %b", c, c);
$display("d= %d = %b", d, d);
$display("e= %d = %b", e, e);
end
endmodule // test_base