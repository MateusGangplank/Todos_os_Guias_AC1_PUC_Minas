// ------------------------- 
// Exercicio02 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
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
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio02 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 'b101010+'b11010; 
b = 'b11010+'o25; 
c = 'o1234/'h2B;
d = 'h1CA-'b101110001; 
e = 25*'o31+'h7A; 
$display("\nResults"); 
$display("a = %d = %b", a, a);  
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
end 
endmodule // test_base 
//h7a=122
//o31=11001