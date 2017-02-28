// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d; 
reg [3:0] e;

reg [5:0] aux1; 
reg [4:0] aux2; 
reg [4:0] aux3; 
reg [4:0] aux4; 
reg [9:0] aux5;
reg [5:0] aux6; 
reg [8:0] aux7; 
reg [8:0] aux8; 
reg [5:0] aux9; 
reg [6:0] aux10;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Pedro Henrique Hardeman Guedes - 397260"); 
$display("Test number system"); 
aux1 = 6'b100010;
aux2 = 5'b11010;
aux3 = 5'b11010;
aux4 = 5'o23;
aux5 = 10'o1234;
aux6 = 6'h2d;
aux7 = 9'h1a9;
aux8 = 9'b101101001;
aux9 = 6'o41;
aux10 = 7'h6b;

a = aux1 + aux2; 
b = aux3 * aux4; 
c = aux5 / aux6; 
d = aux7 - aux8;
e = 25 * aux9 + aux10;

$display("\nPositive value"); 
$display("a = %6b", a); 
$display("b = %6b", b); 
$display("c = %4b", c); 
$display("d = %7b", d); 
$display("e = %10b", e); 
end 
endmodule // test_base 