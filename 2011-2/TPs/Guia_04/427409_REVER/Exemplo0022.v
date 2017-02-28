// -------------------------
// Exemplo0022 - FULL SUBTRACTOR 
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// full subtractor 
// ------------------------- 
module fullSubtractor (output[5:0] s,
input [5:0] a, 
input[5:0] b, 
input [0:0]borrowIn); 
// descrever por portas     ESSA NAO E' A DESCRICAO SUGERIDA ! ! !
assign s = ~(a + b + borrowIn);
endmodule // fullSubtractor 
module test_fullSubtractor; 
// ------------------------- definir dados 
reg [5:0] x; 
reg [5:0] y; 
reg borrow; 
wire [5:0] soma; 

fullSubtractor modulo (soma,x,y,borrow);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Guilherme Rodrigues Melo de Oliveira - 427409"); 
$display("Test ALU's full Subtractor");

x = 6'b010000; y = 6'b011011;borrow = 1;

$display("%b + %b + %b  = %b ",x,y,borrow,soma);  
 
end 
endmodule // test_fullSubtractor