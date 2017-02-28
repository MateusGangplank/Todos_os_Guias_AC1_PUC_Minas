// ------------------------- 
// Exercicio04 - BASE 
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
$display("Exercicio04 - Rafael Tadeu - 451609"); 
$display("Exercicio04"); 

// letra A
a = 6'b101011; 
b = ~4'b1001 + 1;
c = a + b;
$display("\nLetra a"); 
$display("a =  %b(2)", a[7:0]); 
$display("b = %b(2)", b[7:0]);
$display("a  + b =  %b(2)", c[7:0]);
// Letra B
a = 6'b10011; 
b = ~'o15 + 1;
c = a + b;
 
$display("\nLetra b"); 
$display("a =  %b(2)", a[7:0]); 
$display("b = 15(8) = %b(2)", b[7:0]);
$display("a  + b =  %b(2)", c[7:0]);


// Letra C
a = 'o35; 
b = ~'hC + 1;
c = a + b;

$display("\nLetra c"); 
$display("a = 35(8) = %b(2)", a[7:0]); 
$display("b = C(16) = %b(2)", b[7:0]);
$display("a  + b =  %b(2)", c[7:0]);

// Letra D
a = 'hBA; 
b = ~8'b10111001 + 1;
c = a + b;

$display("\nLetra d"); 
$display("a = BA(16) = %b(2)", a[7:0]); 
$display("b = %b(2)", b[7:0]);
$display("a  + b =  %b(2)", c[7:0]);

// Letra E
a = 37; 
b = ~'h1B + 1;
c = a + b;

$display("\nLetra e"); 
$display("a = 37(10) = %b(2)", a[7:0]); 
$display("b = 1B(16) = %b(2)", b[7:0]);
$display("a  + b =  %b(2)", c[7:0]);


end 
endmodule // test_base 