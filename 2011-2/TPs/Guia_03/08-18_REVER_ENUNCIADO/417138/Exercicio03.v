
//-------------------------------
// Exercicio 03
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio03;


reg [5:0]a;  
reg [5:0]b; 
reg [3:0]c; 
reg [4:0]d; 
reg [9:0]e; 


initial begin


$display("Exercicio - 03");
$display("Luiz Marques de Oliveira");
$display("417138");


a= ~6'b100111; 
b= ~6'o54; 
c= ~4'd13;
d= ~5'h1B; 
e= ~5'd25 - 6'd36; 


$display("a = %d = %b ",a,a);
$display("b = %d = %b ",b,b);
$display("c = %d = %b ",c,c);
$display("d = %d = %b ",d,d);
$display("e = %d = %b ",e,e); 


end

endmodule // exercicio03

