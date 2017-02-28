// ------------------------- 
// Exercicio02 - BASE 
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
// ------------------------- parte principal 
initial begin 
$display("Exercicio02 -Gabriel Benjamim de Carvalho - 396690"); 
$display("Test number system"); 
a = 6'b101010 + 5'b11010; 
b = 5'b11010+5'o25; 
c = 10'o1234 / 6'h2b; 
d = 9'h1ca - 9'b101110001;
e = 25 * 5'o31 + 7'h7a;

$display("a = %d = %7b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %3b", c, c); 
$display("d = %d = %3b", d, d); 
$display("e = %d = %3b", e, e); 

end

endmodule