
 // ------------------------- 
// Exemplo0013 - BASE 
// Nome: Jorge Luis dos Santos Leal	 
// Matricula: 417466 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [4:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0013 - Jorge Luis dos Santos Leal - 417466"); 
$display("Test number system"); 
a = 5; 
b = 10; 
c = 15; 
d = 20; 
$display("\nPositive value"); 
$display("a = %d = %3b", a, a); 
$display("b = %d = %4b", a, a); 
$display("c = %d = %5b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %5b", c, c); 
$display("d = %d = %5b", d, d); 
$display("d = %d = %5o", d, d); 
$display("d = %d = %5h", d, d); 

a = ~5+1; 
b = ~5+1; 
c = ~5+1; 

$display("\nNegative mixed expression"); 
$display("a = %d = %3b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %5b", c, c); 
end 
endmodule // test_base 


/*
TESTE---------------
  Exemplo0013 - Jorge Luis dos Santos Leal - 417466
    Test number system
    
    Positive value
    a = 5 = 101
    b = 5 =  101
    c = 5 =   101
    b = 10 = 1010
    c = 15 = 01111
    d = 20 = 10100
    d = 20 =    24
    
    Negative mixed expression
    a = 3 = 011
    b = 11 = 1011
    c = 27 = 11011
	 */