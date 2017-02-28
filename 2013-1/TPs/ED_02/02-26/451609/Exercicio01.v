// ------------------------- 
// Exercicio01 - BASE 
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [6:0] b; 
reg [6:0] c; 
reg [6:0] d; 
reg [6:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio01 - Rafael Tadeu - 451609"); 
$display("Exercicio01"); 

// letra A
a = 3; 
b = 4; 
c = a + b; 

$display("\nLetra a"); 
$display("a = %d = %b", a, a[1:0]); 
$display("b = %d = %b", b, b[2:0]); 
$display("a + b  = %d = %b", c, c[2:0]); 

// Letra B
a = 3; 
b = 8; 
c = a * b; 

$display("\nLetra b"); 
$display("a = %d = %b", a, a[1:0]); 
$display("b = %d = %b", b, b[3:0]); 
$display("a * b  = %d = %b", c, c[4:0]); 

// Letra C
a = 33; 
b = 5; 
c = a / b; 

$display("\nLetra c"); 
$display("a = %d = %b", a, a[5:0]); 
$display("b = %d = %b", b, b[2:0]); 
$display("a / b  = %d = %b", c, c[2:0]);
// Letra D
a = 25; 
b = 11; 
c = a - b; 

$display("\nLetra d"); 
$display("a = %d = %b", a, a[4:0]); 
$display("b = %d = %b", b, b[3:0]); 
$display("a - b  = %d = %b", c, c[3:0]);
// Letra E
a = 2; 
b = 8; 
c = 7; 
d = 1;
e = a * b + c - d;

$display("\nLetra e"); 
$display("a = %d = %b", a, a[1:0]); 
$display("b = %d = %b", b, b[3:0]); 
$display("c = %d = %b", c, c[2:0]);
$display("d = %d = %b", d, d[1:0]);
$display("a * b + c - d = %d = %b", e, e[4:0]);


end 
endmodule // test_base 