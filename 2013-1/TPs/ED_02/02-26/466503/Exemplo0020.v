// ------------------------- 
// Exemplo0020 - BASE 
// Nome: Douglas Henrique Silva Correa
// Matricula: 466503
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0020 - Douglas Henrique Silva Correa - 466503"); 
$display("Test number system"); 
a = 6'b101011 + ( ~4'b1001 + 1 );
b = 5'b10011 + ( ~4'o15 + 1 );
c = 5'o35 + ( ~4'hC + 1 );
d = 8'hBA + ( ~8'b10111001 + 1 );
e = 37 + (  ~5'h1B + 1 );
$display("a= %b", a);
$display("b= %b", b);
$display("c= %b", c);
$display("d= %b", d);
$display("e= %b", e);

end 
endmodule // test_base 