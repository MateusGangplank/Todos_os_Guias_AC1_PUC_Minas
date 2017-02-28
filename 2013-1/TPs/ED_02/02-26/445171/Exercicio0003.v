// ------------------------- 
// Exercicio0003 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [3:0] b; 
reg [5:0] c; 
reg [5:0] d; 
reg [4:0] e;

reg [4:0] a1;
reg [3:0] b1;
reg [5:0] c1;
reg [5:0] d1;
reg [4:0] e1;
// ------------------------- parte principal 
initial begin 
$display("Exercicio 0003 - Raphael Quintao - 445171"); 

a = 6'b101010; 
b = 5'o25; 
c = 6'd27; 
d = 6'h2c; 
e = 6'd25 - 6'd35;

a1 = ~a + 1'b1; 
b1 = ~b + 1'b1; 
c1 = ~c + 1'b1; 
d1 = ~d + 1'b1; 
e1 = ~e + 1'b1; 

$display("a = %3d = %10b", a, a1); 
$display("b = %3d = %10b", b, b1); 
$display("c = %3d = %10b", c, c1);
$display("d = %3d = %10b", d, d1);
$display("e = %3d = %10b", e, e1);
end 
endmodule // test_base 