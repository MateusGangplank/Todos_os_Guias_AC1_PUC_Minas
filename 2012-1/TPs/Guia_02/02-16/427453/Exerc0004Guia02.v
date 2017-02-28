// ------------------------- 
// Exercicio0004 - BASE 
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [8:0] a; 
reg [7:0] b; 
reg [6:0] c; 
reg [5:0] d;
reg [8:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0004 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Executar as operações "); 
#1a = 8'b101010; 
#1b = 7'b011011; 
#1c = 6'd23;
#1d = 5'he;
#1e = 8'o26;
$display("Complemento de 2 "); 
$display("a = %b = %b", a, ~a + 1'b1); 
$display("b = %b = %b", b, ~b + 1'b1); 
$display("c = %b = %b", c, ~c + 1'b1); 
$display("d = %b = %b", d, ~d + 1'b1); 
end 
endmodule // test_base 