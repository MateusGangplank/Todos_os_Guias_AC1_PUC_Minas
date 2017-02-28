// ------------------------- 
// Exercicio0004 - BASE 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module Exercicio04;
//--------------------------definir dados
reg [5:0] a;
reg [7:0] b;
reg [6:0] c;
reg [6:0] d;
reg [6:0] e;
reg [6:0] f;
reg [4:0] g;
reg [4:0] h;
//--------------------------parte principal
initial begin
$display("Exercicio0004 - Filipe Viana de Miranda - 446415"); 
$display("Letra A");
a = 6'b101010;
b = ~a + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", a, b );
$display("%d = %d", a, b );
$display("\n");
$display("Letra B");
c = 7'b011011; //-----------Nao encontrei como colocar base 4 direto se é q tem como ---
d = ~c + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", c, d );
$display("%d = %d", c, d );
$display("\n");
$display("Letra C");
c = 23;
d = ~c + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", c, d );
$display("%d = %d", c, d );
$display("\n");
$display("Letra D");
g = 5'hE;
h = ~g + 1'b1;
$display("\nResultado em Complemento de 2"); 
$display("%b = %b", g, h );
$display("%d = %d", g, h );
$display("\n");
$display("Letra E");
g = 5'o26;
b = ~g + 1'b1 ;
$display("\nResultado em Complemento de 2"); 
$display("%b = %8b", g, b );
$display("%d = %d", g, b );
$display("\n");

end
endmodule