// ------------------------- 
// Exercicio01 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
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
$display("Exercicio01 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 2+15; 
b = 3*8; 
c = 32/3;
d = 21-11; 
e = 2*5+6-1; 
$display("\nResults"); 
$display("a = %d = %b", a, a);  
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
 



end 
endmodule // test_base 