//-------------------------------
// Exercicio 04
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio03;


reg [7:0]a;  
reg [6:0]b; 
reg [5:0]c; 
reg [4:0]d; 
reg [3:0]e; 


initial begin

$display("Exercicio - 04");
$display("Luiz Marques de Oliveira");
$display("417138");


a= -8'b110101;
b= -7'o51; 
c= -6'd11; 
d= -8'hB3; 
e= -5'd19 - 5'd25;

$display("a = %d = %b ",a,-a);
$display("b = %d = %b ",b,-b);
$display("c = %d = %b ",c,-c);
$display("d = %d = %b ",d,-d);
$display("e = %d = %b ",e,-e); 



end

endmodule // exercicio03

