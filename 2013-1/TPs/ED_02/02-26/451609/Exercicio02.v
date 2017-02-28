// ------------------------- 
// Exercicio02 - BASE 
// Nome: Rafael Tadeu Campos de Medeiros 
// Matricula: 451609
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [9:0] a; 
reg [9:0] b; 
reg [9:0] c; 
reg [9:0] d; 
reg [9:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio02 - Rafael Tadeu - 451609"); 
$display("Exercicio02"); 

// letra A
a = 6'b100110; 
b = 5'b11011; 
c = a + b; 

$display("\nLetra a"); 
$display("a = %b(2) = %d(10)", a[5:0], a); 
$display("b = %b(2) = %d(10)", b[4:0], b); 
$display("a + b  = %b(2) = %d(10)", c[6:0], c); 

// Letra B
a = 5'b11101; 
b = 'o25; 
c = a + b; 

$display("\nLetra b"); 
$display("a = %b(2) = %d(10)", a[4:0], a); 
$display("b = %o(8) = %d(10)", b[4:0], b); 
$display("a + b  = %b(2) = %d(10)",c[5:0], c); 

// Letra C
a = 'o1234; 
b = 'h4C; 
c = a / b; 

$display("\nLetra c"); 
$display("a = %o(8) = %d(10)", a[9:0], a); 
$display("b = %h(16) = d(10)b", b[6:0], b); 
$display("a / b  = %b = %d(10)", c[3:0], c);
// Letra D
a = 'h1BA; 
b = 9'b101110011; 
c = a - b; 

$display("\nLetra d"); 
$display("a = %h(16) = %d(10)", a[8:0], a); 
$display("b = %b(2) = %d(10)", b[8:0],b); 
$display("a - b  = %b(2) = %d(10)", c[6:0],c);
// Letra E
a = 25; 
b = 'o32; 
c = 'h8A; 
d = a * b + c;

$display("\nLetra e"); 
$display("a = %b(2) = %d(10)", a[4:0],a); 
$display("b = %o(8) = %d(10)", b[9:0],b); 
$display("c = %h(16) = %d(10)", c[9:0],c);
$display("a * b + c = %b(2) = %d(10)", d[9:0],d);


end 
endmodule // test_base 