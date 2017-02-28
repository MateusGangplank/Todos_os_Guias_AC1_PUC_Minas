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
a = ~6'b101111; 
b = a + 1;

$display("\nLetra a"); 
$display("complemento de 2 de a = 101111(2) = %b(2)", b[7:0]); 

// Letra B
a = ~57; 
b = a + 1; 
 
$display("\nLetra b"); 
$display("complemento de 2 de a = 321(4) = %b(2)", b[6:0]); 


// Letra C
a = ~25; 
b = a + 1; 

$display("\nLetra c"); 
$display("complemento de 2 de a = 25(10) = %b(2)", b[5:0]); 

// Letra D
a = ~'hD; 
b = a +1; 

$display("\nLetra d"); 
$display("complemento de 2 de a = D(16) = %b(2)", b[4:0]); 

// Letra E
a = 'o24; 
b = a + 1; 

$display("\nLetra e"); 
$display("complemento de 2 de 24(8) = %b(2)", b[7:0]); 


end 
endmodule // test_base 