// ------------------------- 
// Exercicio0005 - BASE 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Exercicio04;
//--------------------------definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [6:0] d;
reg [6:0] e;
reg [6:0] f;
reg [4:0] g;
reg [4:0] h;
//--------------------------parte principal
initial begin
$display("Exercicio0005 - Filipe Viana de Miranda - 446415"); 
$display("Letra A");
a = 8'b101010;
b = 8'b1101;
c = a + (~b + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %b", a, b, c);
$display("%d - %d = %d", a, b, c);
$display("\n");
$display("Letra B");
a = 8'b11010; 
b = 8'o15;
c = a + (~b + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %b", a, b, c);
$display("%d - %d = %d", a, b, c);
$display("\n");
$display("Letra C");
a = 8'o34; 
b = 8'hB;
c = a + (~b + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %b", a, b, c);
$display("%d - %d = %d", a, b, c);
$display("\n");
$display("Letra D");
a = 8'hCA; 
b = 8'b10111001;
c = a + (~b + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %b", a, b, c);
$display("%d - %d = %d", a, b, c);
$display("\n");
$display("Letra E");
a = 25; 
b = 8'h1A;
c = a + (~b + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %b", a, b, c);
$display("%d - %d = %d", a, b, c);
$display("\n");


end
endmodule