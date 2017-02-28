// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Douglas Henrique Silva Correa
// Matricula: 466503
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [9:0] c; 
reg [9:0] d; 
reg [9:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0017 - Douglas Henrique Silva Correa - 466503"); 
$display("Test number system"); 
a = 6'b100110 + 5'b11011;
b = 5'b11101 + 5'o25;
c = 10'o1234 + 7'h4C;
d = 9'h1BA - 9'b101110011;
e = 25 * 5'o32 + 8'h8A;
$display("a= %d = %b", a, a);
$display("b= %d = %b", b, b);
$display("c= %d = %b", c, c);
$display("d= %d = %b", d, d);
$display("e= %d = %b", e, e);

end 
endmodule // test_base 