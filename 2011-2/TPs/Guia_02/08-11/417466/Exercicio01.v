//------------------------------------
// Exercício 01
// Jorge Luis dos Santos Leal
// Matrícula: 417466
// 08/2011
//------------------------------------
module Exercicio01;

//----Definir dados
reg [4:0]a,b;
reg [3:0]c,d,e;

//----Parte principal
initial begin

$display("Exercicio 01 - Jorge Luis dos Santos Leal");
$display("Matricula: 417466");

//---a) 2 + 14
a = 2 + 14;

//---b) 3 * 7
b = 3 * 7;

//---c) 34 / 3
c = 34 / 3;

//---d) 19 - 11
d = 19 -11;
 
//---e) 2 * 4 + 6 - 1
e = (2 * 4 ) + 6 - 1;


$display("\na) 2 + 14 = %d = %b",a,a);
$display("\nb) 3 * 7 = %d = %b",b,b);
$display("\nc) 34 / 3 = %d = %b",c,c);
$display("\nd) 19 - 11 = %d = %b",d,d);
$display("\ne) 2 * 4 + 6 - 1 = %d = %b",e,e);
end
endmodule // Exercicio01

/*
TESTE
    Exercicio 01 - Jorge Luis dos Santos Leal
    Matricula: 417466
    
    a) 2 + 14 = 16 = 10000
    
    b) 3 * 7 = 21 = 10101
    
    c) 34 / 3 = 11 = 1011
    
    d) 19 - 11 =  8 = 1000
    
    e) 2 * 4 + 6 - 1 = 13 = 1101

*/

