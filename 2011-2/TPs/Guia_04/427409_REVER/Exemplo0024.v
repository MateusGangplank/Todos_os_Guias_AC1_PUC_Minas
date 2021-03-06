// -------------------------
// Exemplo0024 - COMPARADOR 
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// comparador
// ------------------------- 
module comparador (output[5:0] s,
input [5:0] a, 
input[5:0] b, 
input [0:0]carryIn); 
// descrever por portas     CADE A DESCRICAO ??? ! ! !
assign s = (a - b - carryIn);
endmodule // comparador 
module test_comparador; 
// ------------------------- definir dados 
reg [5:0] x; 
reg [5:0] y; 
reg carry; 
wire [5:0] soma; 

comparador modulo (soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0024 - Guilherme Rodrigues Melo de Oliveira - 427409"); 
$display("Test ALU's comparator diference");

x = 6'b010000; y = 6'b011011;borrow = 1;

$display("%b + %b + %b  = %b ",x,y,borrow,soma);  
 
end 
endmodule // test_comparador