// ------------------------- 
// Exercicio0002 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d; 
reg [9:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio 0002 - Raphael Quintao - 445171"); 

a = 6'b100110 + 5'b11011; 
b = 5'b11101 + 5'o25; 
c = 10'o1234 / 8'h4c; 
d = 9'h1ba - 9'b101110011; 
e = 5'd25 * 5'o32 + 8'h8a;

$display("a = %3d = %10b", a, a); 
$display("b = %3d = %10b", b, b); 
$display("c = %3d = %10b", c, c);
$display("d = %3d = %10b", d, d);
$display("e = %3d = %10b", e, e);
end 
endmodule // test_base 