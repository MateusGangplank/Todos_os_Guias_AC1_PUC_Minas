
 // ------------------------- 
// Guia 2
// Nome: Vinicius dos santos bordoni
// Matricula: 365595
// ------------------------- 
// ------------------------- 
// Complemento de 2 
// ------------------------- 
module complemento_2; 

reg [6:0] a; 
reg [5:0] b; 
reg [4:0] c; 
reg [5:0] d; 
reg [3:0] e;

initial begin 
$display("Guia 02-3 - Vinicius dos santos bordoni - 365595"); 
$display("Complemento de 2"); 
a = -'b100111;
b = -'o54;
c = -'d13;
d = 'h1D;
e = -(25-26);
$display("a = %b = %d",a , a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);

end 
endmodule //
// EXPERIMENTE POR PORTAS

