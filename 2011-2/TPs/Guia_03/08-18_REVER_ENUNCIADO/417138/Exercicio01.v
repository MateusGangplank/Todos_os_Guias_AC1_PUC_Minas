// FAVOR REVER O ENUNCIADO (ALTERADO EM 17/08)

//--------------------------
// Exercicio 01
// Luiz Marques de Oliveira
// 417138
//--------------------------


module exercicio01;

reg [4:0]a; 
reg [4:0]b; 
reg [3:0]c; 
reg [3:0]d; 
reg [3:0]e;

initial begin

$display("Exercicio - 01");
$display("Luiz Marques de Oliveira");
$display("417138");

a = 2 + 14 ;
b = 3 * 7 ;
c = 34 / 3 ;
d = 19 - 11 ;
e = 2 * 4 + 6 - 1 ;


$display("a = %d = %b ",a,a);
$display("b = %d = %b ",b,b);
$display("c = %d = %b ",c,c);
$display("d = %d = %b ",d,d);
$display("e = %d = %b ",e,e);


end

endmodule 
