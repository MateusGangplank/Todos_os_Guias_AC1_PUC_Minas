// ------------------------- 
// Exercicio002 - BASE 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a, b;
reg [5:0] c, g;
reg [8:0] x, y, d;
reg [3:0] e;
reg [6:0] f;
reg [9:0] h;
// ------------------------- parte principal 
initial begin 
$display("Exercicio002 - Marcio Santana"); 
c = 6'b101010;
b = 5'b11010;
f = c+b;
$display("\nLetra A."); 
$display("a = %d = %4b", c, c);
$display("a = %d = %4b", b, b);
$display("a = %d + %d = %7b", b, c, f);

a = 5'b11010;
b = 5'o25;
g = b+a;
$display("\nLetra B."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %4b", b, b, b);
$display("a = %d + %d = %5b", b, a, g);

h = 11'o1234;
g = 6'h2b;
e = h/g;
$display("\nLetra C."); 
$display("a = %d = %4b", h, h);
$display("a = %d = %6b", g, g);
$display("a = %d / %d = %4b", h, g, e);

x = 9'h1ca;
y = 9'b101110001;
f = x-y;
$display("\nLetra D."); 
$display("a = %d = %4b", x, x);
$display("a = %d = %4b", y, y);
$display("a = %d - %d = %4b", x, y, f);

a = 5'o25;
b = 5'o31;
f = 7'h7a;
h = a*b+f;
$display("\nLetra E."); 
$display("a = %d = %4b", a, a);
$display("a = %d = %4b", b, b);
$display("a = %d = %4b", f, f);
$display("a = %d * %d + %d = %4b", a, b, f, h);

end 
endmodule // test_base 