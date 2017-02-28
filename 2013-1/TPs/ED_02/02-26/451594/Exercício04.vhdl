// ------------------------- 
// Exercício04 - BASE 
// Nome: Lucas Ranieri 
// Matricula: 451594 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_06; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercício04 - Lucas Ranieri - 451594"); 
$display("Test number system"); 

a= ~'b101111 + 1;
b= ~'b111001+ 1;
c= ~25+1;
d= ~'hd+1;
e= ~'o24+1;

$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d); 
$display("e = %d = %5b", e, e);




 
end
endmodule