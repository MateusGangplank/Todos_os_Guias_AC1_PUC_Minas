// Exercício03 - BASE 
// Nome: Felipe Cássio Vieira Ferreira 
// Matricula: 451552 
// test number system 
// ------------------------- 
module test_base_06; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [3:0] b; 
reg [2:0] c; 
reg [4:0] d; 
reg [6:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercício03 - Felipe Cássio Vieira Ferreira - 451552"); 
$display("Test number system"); 

a= ~'b101010 + 1;
b= ~'o25+ 1;
c= ~27+1;
d= ~'h2c+1;
e= 25 + ~35+1;

$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d); 
$display("e = %d = %5b", e, e);




 
end
endmodule