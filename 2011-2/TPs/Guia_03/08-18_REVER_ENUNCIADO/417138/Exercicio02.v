//-------------------------------
// Exercicio 02
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio02;


reg [5:0]a;  
reg [5:0]b; 
reg [3:0]c; 
reg [6:0]d; 
reg [9:0]e; 


initial begin

$display("Exercicio - 02");
$display("Luiz Marques de Oliveira");
$display("417138");


a = 6'b100010 + 5'b11010; 
b =  5'b11010 + 5'o23; 
c =  10'o1234 / 6'h2D; 
d =  12'h1A9 - 9'b101101001; 
e = 5'd25 * 6'o41 + 7'h6B; 



$display("a = %d = %b ",a,a);
$display("b = %d = %b ",b,b);
$display("c = %d = %b ",c,c);
$display("d = %d = %b ",d,d);
$display("e = %d = %b ",e,e);



end 

endmodule // exercicio02
