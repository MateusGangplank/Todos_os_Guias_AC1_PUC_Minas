 // ------------------------- 
// Exemplo006 - BASE 
// Nome: Ailton Gomes
// Matricula: 440092 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a;
reg [5:0] b;
reg [11:0] c;
reg [8:0] d;
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo002 - Ailton Gomes - 440092"); 
$display("Test number system"); 
a = 6'b101010 + 5'b11011; 
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3C;
d = 9'h1BA - 9'b101110001;
e = 5'd25 * 6'o32 + 7'h7A;
$display("\n");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %11b", c, c);
$display("d = %d = %8b", b, b);
$display("e = %d = %7b", c, c);
end 
endmodule // test_base 