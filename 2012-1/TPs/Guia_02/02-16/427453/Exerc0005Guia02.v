// ------------------------- 
// Exercicio0005 - BASE 
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d;
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0005 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Executar as operações "); 
#1a = 8'b101010 + ~8'b1101; 
#1b = 8'b11010 + ~8'o15; 
#1c = 8'o34 + ~8'hb;
#1d = 8'hca + ~8'b10111001;
#1e = 8'd25 + ~8'h1a;
$display("Complemento de 2 "); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
end 
endmodule // test_base 