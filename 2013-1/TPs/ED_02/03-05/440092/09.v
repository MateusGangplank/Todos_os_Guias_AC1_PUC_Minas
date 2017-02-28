 // ------------------------- 
// Exemplo009 - BASE 
// Nome: Ailton Gomes
// Matricula: 440092 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a;
reg [7:0] b;
reg [6:0] c;
reg [5:0] d;
reg [6:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo009 - Ailton Gomes - 440092"); 
$display("Test number system"); 
a = ~(6'b101111)+1; 
b = ~(6'b111001)+1 ;
c = ~(5'b11011)+1;
d = ~(4'b1101)+1;
e = ~(5'b10100)+1;
$display("a = %d = %7b", a, a);
$display("b = %d = %7b", b, b);
$display("c = %d = %6b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %6b", e, e);
end 
endmodule // test_base 