
 // ------------------------- 
// Guia 2
// Nome: Vinicius dos santos bordoni
// Matricula: 365595
// ------------------------- 
// ------------------------- 
// Operações
// ------------------------- 
module operacoes; 

reg [5:0] a; 
reg [5:0] b; 
reg [10:7] c; 
reg [9:3] d; 
reg [10:1] e;

initial begin 
$display("Guia 02-2 - Vinicius dos santos bordoni - 365595"); 
$display("Operações"); 
a = 6'b100010 + 5'b11010; 
b = 5'b11010 + 5'o23;
c = 10'o1234 / 6'h2D;
d = 9'h1A9 - 9'b101101001;
e = 25* 6'o41 + 7'h6B;
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);

end 
endmodule // test_base 
