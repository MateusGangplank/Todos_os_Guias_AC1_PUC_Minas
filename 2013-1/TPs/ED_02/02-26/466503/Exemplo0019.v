// ------------------------- 
// Exemplo0019 - BASE 
// Nome: Douglas Henrique Silva Correa
// Matricula: 466503
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
// ------------------------- parte principal 
initial begin 
$display("Exemplo0019 - Douglas Henrique Silva Correa - 466503"); 
$display("Test number system"); 
a = ~6'b101111 + 1;
b = ~6'b111001 + 1;
c = ~25 + 1;
d = ~4'hD + 1;
e = ~5'o24 + 1;
$display("a= %b", a);
$display("b= %b", b);
$display("c= %b", c);
$display("d= %b", d);
$display("e= %b", e);

end 
endmodule // test_base 