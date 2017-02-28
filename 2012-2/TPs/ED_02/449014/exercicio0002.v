//Exercicio00002 BASE
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module conversoes_operacoes;
//-- definir dados
reg [6:0]a;
reg [5:0]b;
reg [3:0]c;
reg [6:0]d;
reg [9:0]e;
//-- parte principal
initial begin
$display("Exercicio0002 - Átila Martins Silva Júnior - 449014");
$display("Conversões e operações:");
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 5'o25;
c = 10'o1234 / 6'h3C;
d = 9'h1BA - 9'b101110001;
e = 25 * 6'o32 + 7'h7A;
$display("\nOperações aritméticas");
$display("6'b101010 + 5'b11011  = %d = %b",a,a);
$display("5'b11011 + 2'o25      = %d = %b",b,b);
$display("10'o1234 / 2'h3C      = %d = %b",c,c);
$display("3'h1BA - 9'b101110001 = %d = %b",d,d);
$display("25 * 2'o32 + 2'h7A    = %d = %b",e,e);
end
endmodule// operacoes_aritimeticas
