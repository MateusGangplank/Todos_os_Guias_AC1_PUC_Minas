// Exercico01 - BASE 
// Nome: Leonardo Machado Decina
// Matricula: 451588 
// test number system 
// ------------------------- 
module test_base_06; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d; 
reg [4:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio01 - Leonardo Machado Decina - 451588"); 
$display("Test number system"); 

a= 3+14;
b= 3*8;
c= 33/5;
d= 25 - 11;
e= 2 * 8 + 7 - 1;

$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d); 
$display("e = %d = %5b", e, e);




 
end
endmodule