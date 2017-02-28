// ------------------------- 
// Exercicio0003 - BASE 
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [15:0] a; 
reg [15:0] b; 
reg [15:0] c; 
reg [15:0] d;
reg [15:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0003 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Executar as operações "); 
#1a = 6'b100111; 
#1b = 15'o23; 
#1c = 23;
#1d = 26 - 36;
$display("Complemento de 2 "); 
$display("a = %b = %b", a, ~a + 1'b1); 
$display("b = %b = %b", b, ~b + 1'b1); 
$display("c = %b = %b", c, ~c + 1'b1); 
$display("d = %b = %b", d, ~d + 1'b1); 
end 
endmodule // test_base 