// ------------------------- 
// Exercicio0002 - BASE 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Exercicio02;
//--------------------------definir dados
reg [5:0] a;
reg [4:0] b;
reg [6:0] c;
reg [5:0] d;
reg [9:0] e;
reg [10:0] f;
reg [8:0] g;
reg [4:0] h;
//--------------------------parte principal
initial begin
$display("Exercicio0002 - Filipe Viana de Miranda - 446415"); 
$display("Letra A"); 
a = 6'b101010;
b = 5'b11010;
c = a + b;
$display("\nResultado em Binario"); 
$display("%b + %b = %b", a, b,c );
$display("\nResultado em Decimal"); 
$display("%d + %d = %d", a, b,c );
$display("\n");
$display("Letra B"); 
a = 5'b11010;
d = 'o25;
c = a + d;
$display("\nResultado em Binario"); 
$display("%b + %b = %b", a, d,c );
$display("\nResultado em Decimal"); 
$display("%d + %d = %d", a, d,c );
$display("\n");
$display("Letra C"); 
e = 'o1234;
c = 'h2B;
f = e / c;
$display("\nResultado em Binario"); 
$display("%b / %b = %b", e, c,f );
$display("\nResultado em Decimal"); 
$display("%d / %d = %d", e, c,f );
$display("\n");
$display("Letra D"); 
g = 'h1CA;
e = 9'b101110001;
f = g - e;
$display("\nResultado em Binario"); 
$display("%b - %b = %b", g, e,f );
$display("\nResultado em Decimal"); 
$display("%d - %d = %d", g, e,f );
$display("\n");
$display("Letra E"); 
h = 25;
b = 'o31;
c = 'h7A;
f = h* b + c ;
$display("\nResultado em Binario"); 
$display("%b * %b + %b = %b", h, b,c,f );
$display("\nResultado em Decimal"); 
$display("%d * %d + %d = %d", h, b,c,f );
$display("\n");

end 
endmodule