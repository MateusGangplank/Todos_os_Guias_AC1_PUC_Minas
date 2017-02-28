// ------------------------- 
// Exercicio 0003
// Nome:Julio Miranda machado 
// Matricula: 435666-7
// ------------------------- 
// ------------------------- 
// 
// ------------------------- 
module exe03; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

// ------------------------- parte principal 
initial begin 
$display("Exe003 Julio Machado - 435666"); 
$display(" Operações"); 
a = ~6'b100111; 
b = ~8'o54; 
c = ~10'd13 ; 
d = ~16'h1B ;
e = ~(25 - 36);
   
$display("\nResultados"); 
$display("a = %4b", a,); 
$display("b = %4b", b); 
$display("c = %5b", c);  
$display("d = %5b", d); 
$display("e = %5b", e);  
end 
endmodule // Fim operações