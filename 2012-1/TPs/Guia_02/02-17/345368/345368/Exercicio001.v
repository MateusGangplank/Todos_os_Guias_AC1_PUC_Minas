// ------------------------- 
// Exercicio001 - BASE 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a, b, d;
reg [5:0] c;
reg [3:0] x, y, z, w, e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio001 - Marcio Santana Correa"); 
a = 2;
b = 15;
d = a+b;
$display("\nLetra A."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %4b", b, b);
$display("a = %d + %d = %4b", b, a, d);

a = 3;
b = 8;
d = b*a;
$display("\nLetra B."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %4b", b, b);
$display("a = %d * %d = %5b", b, a, d);

a = 3;
c = 32;
e = c/a;
$display("\nLetra C."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %6b", c, c);
$display("a = %d / %d = %4b", c, a, e);

a = 21;
b = 11;
e = a-b;
$display("\nLetra D."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %4b", b, b);
$display("a = %d - %d = %4b", b, a, e);

x = 2;
y = 5;
z = 6;
w = 1;
e = x*y+z-w;
$display("\nLetra E."); 
$display("a = %d = %4b", x, x);
$display("a = %d = %4b", y, y);
$display("a = %d = %4b", z, z);
$display("a = %d = %4b", w, w);
$display("a = %d * %d + %d - %d = %4b", x, y, z, w, e);

end 
endmodule // test_base 