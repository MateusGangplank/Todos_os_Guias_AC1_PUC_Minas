//Exercicio00004 BASE
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module complementos;
//-- definir dados
reg [7:0]a;
reg [6:0]b;
reg [5:0]c;
reg [4:0]d;
reg [7:0]e;
//-- parte principal
initial begin
$display("Exercicio0004 - Átila Martins Silva Júnior - 449014");
$display("Complementos de 2:");
a = ~6'b101011+1;
b = ~6'b111001+1;//--321 na base 4
c = ~27+1;
d = ~4'hC+1;
e = ~6'o21+1;
$display("\nComplementos de 2 nas bases, 10 e 2");
$display("6'b101011  = %d = %8b",a,a);//-- poderia ser representado com 7 bits
$display("6'b111001  = %d = %7b",b,b);
$display("27         =  %d = %6b",c,c);
$display("4'hC       =  %d = %5b",d,d);
$display("6'o21      = %d = %8b",e,e);//--poderia ser representado com 6 bits
end
endmodule// complementos
