// ------------------------- 
// Exemplo0014
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module exercicio01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d; 
reg [4:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio001 - Mateus Cunha da Silva - 463624"); 
$display("Test number system"); 
a = 3 + 14; 
b = 3 * 8; 
c = 33 / 5; 
d = 25 - 11;
e = (2 * 8) + 7 -1;
$display (" 3 + 14 = %b = %d", a, a);
$display (" 3 * 8 = %b = %d", b, b);
$display (" 33 / 5 = %b = %d", c, c);
$display (" 25 - 11 = %b = %d", d, d);
$display (" 2 * 8 + 7 - 1 = %b = %d", e, e);
  
end 
endmodule // test_base


