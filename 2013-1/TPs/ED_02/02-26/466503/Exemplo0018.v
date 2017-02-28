// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Douglas Henrique Silva Correa
// Matricula: 466503
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [5:0] c; 
reg [6:0] d; 
reg [5:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0018 - Douglas Henrique Silva Correa - 466503"); 
$display("Test number system"); 
a = ~6'b101010 + 1;
b = ~5'o25 + 1;
c = ~27 + 1;
d = ~6'h2C + 1;
e = ~( 25 - 35 ) + 1;
$display("a= %b", a);
$display("b= %b", b);
$display("c= %b", c);
$display("d= %b", d);
$display("e= %b", e);

end 
endmodule // test_base 