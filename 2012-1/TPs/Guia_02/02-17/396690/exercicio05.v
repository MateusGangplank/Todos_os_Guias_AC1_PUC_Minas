// ------------------------- 
// Exercicio05 - BASE 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d;
reg [7:0] e;
reg f; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio05 -Gabriel Benjamim de Carvalho - 396690"); 
$display("Test number system"); 
a = 6'b101010 - 4'b1101; 
b = 5'b11010 -4'o15 ; 
c = 5'o34 - 4'hb; 
d = 8'hca - 8'b10111001;
e = 25 - 5'h1a;
f = 1'b1;

$display("a = %d = %8b = C2 = %8b", a, a, ~a+f); 
$display("b = %d = %8b = C2 = %8b", b, b, ~b+f); 
$display("c = %d = %8b = C2 = %8b", c, c, ~c+f); 
$display("d = %d = %8b = C2 = %8b", d, d, ~d+f); 
$display("e = %d = %8b = C2 = %8b", e, e, ~e+f); 

end

endmodule