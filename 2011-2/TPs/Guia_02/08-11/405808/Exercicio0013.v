// ------------------------- 
// Exercicio0013 - BASE 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_03; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] az;
reg [5:0] b;
reg [5:0] bz; 
reg [5:0] c; 
reg [3:0] cz;
reg [5:0] d; 
reg [4:0] dz;
reg [4:0] e;
reg [4:0] ez; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0013 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test number system"); 
a = 6'b100111;
az = ~a+1;
b = 6'o54;
bz = ~b+1;
c = 13;
cz = ~c+1;
d = 8'h1b;
dz = ~d+1;
e = -(25 - 36);
ez = ~e+1;
$display("\n2's Complements"); 
$display("a = %d = %6b", a, az); 
$display("b = %d = %6b", b, bz);
$display("c = %d = %4b", c, cz);
$display("d = %d = %5b", d, dz);
$display("e = -%d = %5b", e, ez);
end 
endmodule // test_base 3