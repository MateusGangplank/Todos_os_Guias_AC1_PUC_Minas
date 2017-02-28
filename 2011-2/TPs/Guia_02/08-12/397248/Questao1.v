 // ------------------------- 
// Questao1 - Guia02 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a;
reg [4:0] b;
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;
// ------------------------- parte principal 
initial begin 
$display("Questao1 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11;
e = 2 * 4 + 6 - 1; 
$display("\nResultados das equacoes"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c); 
$display("d = %d = %4b", d, d); 
$display("e = %d = %4b", e, e); 
end 
endmodule // test_base 