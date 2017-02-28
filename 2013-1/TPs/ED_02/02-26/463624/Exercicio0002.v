// ------------------------- 
// Exercicio2
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module exercicio02; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d; 
reg [9:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio002 - Mateus Cunha da Silva - 463624"); 
$display("Test number system"); 
a = 6'b100110 + 5'b11011; 
b = 5'b11101 + 5'o25; 
c = 10'o1234 / 7'h4C; 
d = 9'h1BA - 9'b101110011;
e = (25 * 6'o32) + 8'h8A;
$display ("  100110 + 11011 = %b = %d", a, a);
$display ("  11101b + 25o; = %b = %d", b, b);
$display (" 1234o / 4Ch = %b = %d", c, c);
$display (" 1BA  - 101110011 = %b = %d", d, d);
$display (" 25 * 32o + 8Ah = %b = %d", e, e);
  
end 
endmodule // test_base


