// ------------------------- 
// Exercicio0001 - BASE 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Exercicio01;
//--------------------------definir dados
reg [2:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] x;
reg [3:0] d;
//--------------------------parte principal
initial begin
$display("Exercicio0001 - Filipe Viana de Miranda - 446415"); 
$display("Letra A"); 
a = 2;
b = 15;
c = a + b;
$display("\nResultado em Binario"); 
$display("%b + %b = %5b", a, b,c );
$display("\nResultado em Decimal"); 
$display("%d + %d = %d", a, b,c );
$display("\n");
$display("Letra B");
a = 3;
b = 8;
c = a*b; 
$display("\nResultado em Binario"); 
$display("%b * %b = %b", a, b,c );
$display("\nResultado em Decimal"); 
$display("%d * %d = %d", a, b,c );
$display("\n");
$display("Letra C");
x = 32;
b = 3;
c = x/b; 
$display("\nResultado em Binario"); 
$display("%b / %b = %b", x, b,c );
$display("\nResultado em Decimal"); 
$display("%d / %d = %d", x, b,c );
$display("\n");
$display("Letra D");
x = 21;
b = 11;
c = x-b; 
$display("\nResultado em Binario"); 
$display("%b - %b = %b", x, b,c );
$display("\nResultado em Decimal"); 
$display("%d - %d = %d", x, b,c );
$display("\n");
$display("Letra E");
a = 2;
b = 5;
c = 6;
d = 1;
x = a*b+c-d;
$display("\nResultado em Binario"); 
$display("%b * %b + %b - %b = %b", a, b,c,d,x );
$display("\nResultado em Decimal"); 
$display("%d * %d + %d - %d = %d", a, b,c,d,x );
end
endmodule 
