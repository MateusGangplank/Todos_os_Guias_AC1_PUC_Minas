// ------------------------- 
// Exemplo0015 - Complementos 
// Nome: Ítalo Guimarães Otoni	 
// Matricula: 451581 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [4:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0015 - Ítalo Guimarães Otoni - 451581"); 
$display("0= %d = %3b = %b", ~'b1 , (1-1), ~'b1 ); 
$display("1= %d = %3b = %b", ~'b0 , (2-1), ~'b0 ); 
$display("2= %d = %3b = %b", (1+1), (3-1), ~'b0+~'b0);  
end
endmodule