// ------------------------- 
// Exercicio4
// Nome: Pedro Henrique Hardeman Guedes 
// Matricula: 397260
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_04; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio4 - Pedro Henrique Hardeman Guedes - 397260"); 
$display("Test number system"); 
a = -6'b101010; 
b = -5'23; 
c = -23; 
d = -4'hE; 
e = -5'o26; 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 

end 
endmodule // test 