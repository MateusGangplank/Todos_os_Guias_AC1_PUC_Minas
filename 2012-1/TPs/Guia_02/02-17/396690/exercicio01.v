// ------------------------- 
// Exercicio01 - BASE 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d;
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01 -Gabriel Benjamim de Carvalho - 396690"); 
$display("Test number system"); 
a = 2+15; 
b = 3*8; 
c = 32/3; 
d = 21-11;
e = 2*5+6-1;

$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %3b", c, c); 
$display("d = %d = %3b", d, d); 
$display("e = %d = %3b", e, e); 

end

endmodule