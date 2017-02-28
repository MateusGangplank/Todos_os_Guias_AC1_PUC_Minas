// ------------------------- 
// Exemplo05 - BASE 
// Nome: Lucas Ranieri 
// Matricula: 451594 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_02; 
// ------------------------- definir dados 
reg [3:0] a; 
reg [3:0] b; 
reg [5:0] c; 
reg [4:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo05 - Lucas Ranieri - 451594"); 
$display("Test number system"); 
a = 5 + 3; 
b = 5 + 3; 
c = 10 - 5 + 25 + 3 + 1; 
$display("\nOverflow"); 
$display("a = %d = %3b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %5b", c, c);

$display("\nComplements"); 
$display("0= %d = %3b = %3b", ~1 , (1-1), ~1 ); 
$display("1= %d = %3b = %3b", ~0 , (2-1), ~0 ); 
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0); 
 
end
endmodule