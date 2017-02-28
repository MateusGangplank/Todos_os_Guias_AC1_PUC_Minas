// ------------------------- 
// Exercicio0004 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [7:0] e;

reg [7:0] a1;
reg [6:0] b1;
reg [5:0] c1;
reg [4:0] d1;
reg [7:0] e1;
// ------------------------- parte principal 
initial begin 
$display("Exercicio 0004 - Raphael Quintao - 445171"); 

a = 6'b101111; 
b = 6'b111001; 
c = 5'd25; 
d = 4'hd; 
e = 5'o24;

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