// Exercicio02 - BASE 
// Nome: Leonardo Machado Decina
// Matricula: 451588 
// test number system  
// ------------------------- 
module test_base_06; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d; 
reg [9:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio02 - Leonardo Machado Decina - 451588"); 
$display("Test number system"); 

a= 'b100110 + 'b11011;
b= 'b11101 + 'o25;
c= 'o1234/ 'h4c;
d= 'h1ba - 'b101110011;
e= 25 * 26 + 'h8a;

$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d); 
$display("e = %d = %5b", e, e);




 
end
endmodule