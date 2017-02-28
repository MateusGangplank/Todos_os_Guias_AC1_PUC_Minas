// Exercicio05 - BASE 
// Nome: Leonardo Machado Decina
// Matricula: 451588 
// test number system
// ------------------------- 
module test_base_06; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercício05 - Leonardo Machado Decina - 451588"); 
$display("Test number system"); 

a= 'b101011 + ~'b1001+1;
b= 'b10011 + ~'o15+1;
c= 'o35 + ~'hc+1;
d= 'hBA + ~'b10111001 +1;
e= 37 + ~'h1b+1;

$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d); 
$display("e = %d = %5b", e, e);




 
end
endmodule