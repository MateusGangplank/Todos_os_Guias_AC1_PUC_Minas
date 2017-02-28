//------------------------------------
// Exercício 03
// Jorge Luis dos Santos Leal
// Matrícula: 417466
// 08/2011
//------------------------------------
module Exercicio03;

//----Definir dados
reg [4:0]a,b;
reg [1:0]c;
reg [2:0]d;
reg [3:0]e;

//----Parte principal
initial begin

$display("Exercicio 03 - Jorge Luis dos Santos Leal");
$display("Matricula: 417466");
$display("Complemento de 2");
//---Para as operaçoes, subtrai do total de bits todos iguais a 1, o valor em binário , converti para decimal 
//---e somei mais 1

//---a) 100111(2) @63 = 111111

a = 63 - 39 + 1;

//---b) 54(8) = 101100 @63 = 111111

b = 63 - 44 + 1;

//---c) 13(10) = 1101   @15 = 1111

c = 15 - 13 + 1;

//---d) 1B(16) = 11011   @31 = 11111

d = 31 - 27 + 1;
 
//---O resultado será -11 que tem a mesma representação de 10 decimal e somando mais 1 tenho o valor de 11 positivo
//---e) 25 - 36   
 
e = (25 - 36)* -1;


$display("\na) 100111(2) C2= %b(2)",a);
$display("\nb) 54(8) C2= %b(2)",b);
$display("\nc) 13(10) C2= %b(2)",c);
$display("\nd) 1B(16) C2= %b(2)",d);
$display("\ne) 25 - 36 C2= %b(2)",e);
end
endmodule // Exercicio03

/*
TESTE
    Exercicio 03 - Jorge Luis dos Santos Leal
    Matricula: 417466
    Complemento de 2
    
    a) 100111(2) C2= 11001(2)
    
    b) 54(8) C2= 10100(2)
    
    c) 13(10) C2= 11(2)
    
    d) 1B(16) C2= 101(2)
    
    e) 25 - 36 C2= 1011(2)
	 */


         // OBS.: EXPERIMENTE USAR PORTAS AO INVES DE OPERACOES ARITMETICAS.