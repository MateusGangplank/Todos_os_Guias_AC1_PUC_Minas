// ------------------------- 
// Exercicio 0001 
// Nome:Julio Miranda machado 
// Matricula: 435666-7
// ------------------------- 
// ------------------------- 
// 
// ------------------------- 
module exe01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b;
reg [4:0] c;
reg [4:0] d;
reg [4:0] e;

// ------------------------- parte principal 
initial begin 
$display("Exe001 Julio Machado - 435666"); 
$display(" Operações"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3 ; 
d = 19 - 11;
e = 2 * (4 + 6 - 1);
   
$display("\nResultados"); 
$display("a = %4b", a,); 
$display("b = %4b", b); 
$display("c = %5b", c);  
$display("d = %5b", d); 
$display("e = %5b", e);  
end 
endmodule // Fim operações