 // ------------------------- 
// Exemplo006 - BASE 
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
$display("Exemplo002 - Ailton Gomes - 440092"); 
$display("Test number system"); 
a = 3 + 14;
b = 3 * 8;
c = 33 / 5;
d = 25 - 11;
e = 2 * 8 + 7 - 1;
$display("\n");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", b, b);
$display("e = %d = %5b", c, c);
end 
endmodule // test_base 