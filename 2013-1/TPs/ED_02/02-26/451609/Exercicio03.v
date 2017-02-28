// ------------------------- 
// Exercicio03 - BASE 
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
$display("Exercicio03 - Rafael Tadeu - 451609"); 
$display("Exercicio03"); 

// letra A
a = ~6'b101010; 
b = a + 1;

$display("\nLetra a"); 
$display("complemento de 2 de a = 101010(2) = %b(2)", b[6:0]); 

// Letra B
a = ~'o25; 
b = a + 1; 
 
$display("\nLetra b"); 
$display("complemento de 2 de a = 25(8) = %b(2)", b[5:0]); 


// Letra C
a = ~27; 
b = a + 1; 

$display("\nLetra c"); 
$display("complemento de 2 de a = 27(10) = %b(2)", b[5:0]); 

// Letra D
a = ~'h2C; 
b = a +1; 

$display("\nLetra d"); 
$display("complemento de 2 de a = 2C(16) = %b(2)", b[6:0]); 

// Letra E
a = 25; 
b = ~35; 
c =b + 1; 
d = a + c;

$display("\nLetra e"); 
$display("complemento de 2 de 25(10) - 35(10) = %b(2)", b[6:0]); 


end 
endmodule // test_base 