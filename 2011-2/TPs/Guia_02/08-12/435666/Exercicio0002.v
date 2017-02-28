// ------------------------- 
// Exercicio 0002 
// Nome:Julio Miranda machado 
// Matricula: 435666-7
// ------------------------- 
// ------------------------- 
// 
// ------------------------- 
module exe01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

// ------------------------- parte principal 
initial begin 
$display("Exe002 Julio Machado - 435666"); 
$display(" Operações"); 
a = 6'b100010 + 5'b11010; 
b = 6'b11010 + 7'o23; 
c = 12'o1234 / 16'h2D ; 
d = 16'hA9 - 9'b101101001;
e = 25 * (8'o41 + 16'h6B);
   
$display("\nResultados"); 
$display("a = %4b", a,); 
$display("b = %4b", b); 
$display("c = %5b", c);  
$display("d = %5b", d); 
$display("e = %5b", e);  
end 
endmodule // Fim operações