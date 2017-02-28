//Exercicio00003 BASE
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module complementos;
//-- definir dados
reg [6:0]a;
reg [5:0]b;
reg [5:0]c;
reg [6:0]d;
reg [3:0]e;
//-- parte principal
initial begin
$display("Exercicio0003 - Átila Martins Silva Júnior - 449014");
$display("Complementos de 2:");
a = ~6'b100110+1;
b = ~5'o24+1;
c = ~25+1;
d = ~6'h2D+1;
e = ~(27-37)+1;
$display("\nComplementos de 2 nas bases, 10 e 2");
$display("6'b100110  =%d = %7b",a,a);
$display("5'o24      = %d = %6b",b,b);
$display("25         = %d = %6b",c,c);
$display("6'h2D      =%d = %7b",d,d);
$display("27-37      = %d =%5b",e,e);
end
endmodule// complementos
