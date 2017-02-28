/*
Estudo Dirigido02 - Exercicio001
Nome: Sheila de Oliveira Santana - 415266
*/

module Exercicio001;

 //definir dados
 reg[4:0]a;
 reg[4:0]b;
 reg[2:0]c;
 reg[3:0]d;
 reg[4:0]e;
 
//parte principal
 initial begin
 $display("Estudo Dirigido02 - Exercicio001 - Sheila de Oliveira Santana - 415266");
 a=2+14;
 b=3*9;
 c=32/5;
 d=24-11;
 e=2*6+7-1;
 
$display("a= 2+14 = %d = %4b",a,a);
$display("b= 3*9 = %d = %4b",b,b);
$display("c= 32/5 = %d = %2b",c,c);
$display("d= 24-11 = %d = %3b",d,d);
$display("e= 2*6+7-1 = %d = %5b",e,e);

end

endmodule

/*
-------------------------------------------------

Resultado:

> Executing: C:\Program Files\ConTEXT\ConExec.exe "C:\Program Files\iverilog\bin\vvp.exe" Exercicio001.vvp

Estudo Dirigido02 - Exercicio001 - Sheila de Oliveira Santana - 415266
a= 2+14 = 16 = 10000
b= 3*9 = 27 = 11011
c= 32/5 = 6 = 110
d= 24-11 = 13 = 1101
e= 2*6+7-1 = 18 = 10010
> Execution finished.


*/