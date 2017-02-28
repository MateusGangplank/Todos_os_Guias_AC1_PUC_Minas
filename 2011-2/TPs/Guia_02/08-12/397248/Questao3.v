// -------------------------
// Questao3 - Guia02 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a;
reg [5:0] b;
reg [3:0] c;
reg [4:0] d;
reg [4:0] e;

reg [6:0] a1;
reg [6:0] b1;
reg [4:0] c1;
reg [5:0] d1;
reg [5:0] e1;
// ------------------------- parte principal 
initial begin 
$display("Questao3 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test number system"); 
a = 6'b100111; 
b = 6'o54; 
c = 13; 
d = 5'h1b;
e = 25 - 36;

a1 = -6'b100111;
b1 = -6'o54;
c1 = -4'd13;
d1 = -5'h1b;
e1 = 5'd11;
 
$display("\nResultados dos complementos"); 
$display("a = %6b", a1); 
$display("b = %6b", b1); 
$display("c = %4b", c1); 
$display("d = %5b", d1); 
$display("e = %5b", e1); 
end 
endmodule // test_base 

// OBS.: EXPERIMENTE USAR PORTAS AO INVES DE OPERADORES ARITMETICOS.
