//Exercicio0001 - BASE
//Nome: �tila Martins Silva J�nior
//Matr�cula: 449014
//-------------------------------
//number system
//------------------------------
module operacoes_aritimeticas;
// -- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// -- parte principal
initial begin
$display("Exercicio0001 - �tila Martins Silva J�nior - 449014");
$display("Opera��es aritim�ticas:");
a = 2+14;
b = 3*9;
c = 32/5;
d = 24-11;
e = 2*6+7-1;
$display("\nOpera��es aritm�ticas");
$display("2+14 = %d = %b",a,a);
$display("3*9 = %d = %b",b,b);
$display("32/5 = %d = %b",c,c);
$display("24-11 = %d = %b",d,d);
$display("2*6+7-1 = %d = %b",e,e);
end
endmodule// operacoes_aritimeticas



