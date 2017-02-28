// ------------------------- 
// Exercicio03 - BASE 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690 
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
reg f; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio03 -Gabriel Benjamim de Carvalho - 396690"); 
$display("Test number system"); 
a = 6'b100111; 
b = 5'o23; 
c = 23; 
d = 6'h2b;
e = 26-36;
f = 1'b1;

$display("a = %d = %7b = C2 = %7b", a, a, ~a+f); 
$display("b = %d = %4b = C2 = %5b", b, b, ~b+f); 
$display("c = %d = %3b = C2 = %5b", c, c, ~c+f); 
$display("d = %d = %3b = C2 = %6b", d, d, ~d+f); 
$display("e = %d = %3b = C2 = %9b", e, e, ~e+f); 

end

endmodule