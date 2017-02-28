//-------------------------------
// Exercicio 05
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module exercicio05;


reg [7:0]f;  
reg [6:0]g; 
reg [5:0]h; 
reg [4:0]i; 
reg [3:0]j; 


initial begin


$display("Exercicio - 05");
$display("Luiz Marques de Oliveira");
$display("417138");


f= ~5'b10001; 
g= ~6'o64; 
h= ~4'd14; 
i= ~8'hC4; 
j= ~6'd28 - 6'd35; 




$display("f = %d",f,-f);
$display("g = %o",g,-g);
$display("h = %h",h,-h);
$display("i = %o",i,-i);
$display("j = %d",j,-j); 



end

endmodule // exercicio03

