 // ------------------------- 
// Exemplo008 - BASE 
// Nome: Ailton Gomes
// Matricula: 440092 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a;
reg [8:0] b;
reg [6:0] c;
reg [4:0] d;
reg [4:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo008 - Ailton Gomes - 440092"); 
$display("Test number system"); 
a = ~(6'b101010)+1; 
b = ~(5'o25)+1 ;
c = ~(6'd27)+1;
d = ~(6'h2c)+1;
e = ~(25 - 35)+1;
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end 
endmodule // test_base 