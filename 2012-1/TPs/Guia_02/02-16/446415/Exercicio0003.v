// ------------------------- 
// Exercicio0003 - BASE 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Exercicio03;
//--------------------------definir dados
reg [5:0] a;
reg [5:0] b;
reg [4:0] c;
reg [4:0] d;
reg [5:0] e;
reg [5:0] f;
reg [4:0] g;
//--------------------------parte principal
initial begin
$display("Exercicio0003 - Filipe Viana de Miranda - 446415"); 
$display("Letra A");
a = 'b100111;
b = ~a + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", a, b );
$display("%d = %d", a, b );
$display("\n");
$display("Letra B");
c = 'o23;
d = ~c + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", c, d );
$display("%d = %d", c, d );
$display("\n");
$display("Letra C");
c = 'd23;
d = ~c + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", c, d );
$display("%d = %d", c, d );
$display("\n");
$display("Letra D");
a = 'h2B;
b = ~a + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", a, b );
$display("%d = %d", a, b );
$display("\n");
$display("Letra E");//-----nao consegui achar uma maneira de operar com o sinal
e = 26;
f = 36;
g = e + (~f + 1'b1);
$display("\nResultado em Complemento de 2"); 
$display("%b - %b = %4b", e, ~f+1'b1,g );
$display("%d - %d = %d", e, f,g );
$display("\n");

end
endmodule