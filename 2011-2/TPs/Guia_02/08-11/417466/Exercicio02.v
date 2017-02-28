//------------------------------------
// Exercício 02
// Jorge Luis dos Santos Leal
// Matrícula: 417466
// 08/2011
//------------------------------------
module Exercicio02;

//----Definir dados
reg [5:0]a,b;
reg [3:0]c;
reg [6:0]d;
reg [9:0]e;

//----Parte principal
initial begin

$display("Exercicio 02 - Jorge Luis dos Santos Leal");
$display("Matricula: 417466");
$display("Operacoes com resultado em binario");
//---´Para as operaçoes, converti os valores para decimal
//---a) 100010(2) + 11010(2)

a = 34 + 26;

//---b) 11010(2) + 23(8)

b = 26 + 19;

//---c) 1234(8) / 2D(16) 

c = 668 / 45;

//---d) 1A9(16) - 101101001(2)
d = 425 - 361;
 
//---e) 25 * 41(8) + 6B(16) 

e = 25 * 33 + 107;


$display("\na) 100010(2) + 11010(2) = %b(2)",a);
$display("\nb) 11010(2) + 23(8) = %b(2)",b);
$display("\nc) 1234(8) / 2D(16) = %b(2)",c);
$display("\nd) 1A9(16) - 101101001(2) = %b(2)",d);
$display("\ne) 25 * 41(8) + 6B(16) = %b(2)",e);
end
endmodule // Exercicio02

/*
TESTE
    Exercicio 02 - Jorge Luis dos Santos Leal
    Matricula: 417466
    Operacoes com resultado em binario
    
    a) 100010(2) + 11010(2) = 111100(2)
    
    b) 11010(2) + 23(8) = 101101(2)
    
    c) 1234(8) / 2D(16) = 1110(2)
    
    d) 1A9(16) - 101101001(2) = 1000000(2)
    
    e) 25 * 41(8) + 6B(16) = 1110100100(2)*/

