// ------------------------- 
// Exemplo0015 - Complementos 
// Nome: Rafael Guimar�es de Sousa 
// Matricula: 451607
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
$display("Exemplo0011 - Rafael Guimar�es de Sousa - 451607"); 
$display("Test number system"); 
$display("\nComplements"); 
$display("0= %d = %3b = %3b", ~1 , (1-1), ~1 ); 
$display("1= %d = %3b = %3b", ~0 , (2-1), ~0 ); 
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);  
end
endmodule