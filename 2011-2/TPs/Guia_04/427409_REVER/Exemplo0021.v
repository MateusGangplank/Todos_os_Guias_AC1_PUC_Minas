// -------------------------
// Exemplo0021 - FULL ADDER 
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module fullAdder (output[5:0] s,
input [5:0] a, 
input[5:0] b, 
input [0:0]carryIn); 
// descrever por portas        CADE A DESCRICAO POR PORTA ??? ! ! !
assign s = (a + b + carryIn);
endmodule // fullAdder 
module test_fullAdder; 
// ------------------------- definir dados 
reg [5:0] x; 
reg [5:0] y; 
reg carry; 
wire [5:0] soma; 

fullAdder modulo (soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Guilherme Rodrigues Melo de Oliveira - 427409"); 
$display("Test ALU's full adder");

x = 6'b010000; y = 6'b011011;carry = 1;

$display("%b + %b + %b  = %b ",x,y,carry,soma);  
 
end 
endmodule // test_fullAdder 