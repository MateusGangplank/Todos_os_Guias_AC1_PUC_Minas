// ------------------------- 
// Exercicio05 - BASE 
// Nome: Gabriel Luiz Marquezini Gonçalves Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio05 - Gabriel Luiz Marquezini Gonçalves Vieira - 441691"); 
$display("Test number system"); 
a = 8'b101010; 
b = 8'b1101;
c = a+(~b+1'b1);
$display("\nResults"); 
$display("A: %b - %b = %b = %d", a, b, c, c); 
a = 8'b11010; 
b = 8'o15;
c = a+(~b+1'b1);
$display("B: %b - %b = %b = %d", a, b, c, c);
a = 8'o34; 
b = 8'hB;
c = a+(~b+1'b1); 
$display("C: %b - %b = %b = %d", a, b, c, c); 
a = 8'hCA; 
b = 8'b10111001;
c = a+(~b+1'b1);
$display("D: %b - %b = %b = %d", a, b, c, c); 
a = 25; 
b = 8'h1A;
c = a+(~b+1'b1);
$display("E: %b - %b = %b = %d", a, b, c, c); 
end 
endmodule // test_base 
