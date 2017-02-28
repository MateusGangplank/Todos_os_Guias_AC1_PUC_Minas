// -------------------------
// Exemplo0025 - COMPARADOR 
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// comparador
// ------------------------- 
module comparador (output[5:0] s,
input [5:0] a); 
// descrever por portas 
assign s = (a);             // ISSO NAO E' UM COMPARADOR!
endmodule // comparador 
module test_comparador; 
// ------------------------- definir dados 
reg [5:0] x;  
wire [5:0] soma; 

comparador modulo (soma,x);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0025 - Guilherme Rodrigues Melo de Oliveira - 427409"); 
$display("Test ALU's comparator diference");

x = 6'b010000;

$display("%b = %d = %b ",x,(soma+1),~(soma));  
 
end 
endmodule // test_comparador