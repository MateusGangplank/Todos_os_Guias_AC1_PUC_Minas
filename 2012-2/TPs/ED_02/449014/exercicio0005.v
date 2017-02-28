//Exercicio00005 BASE
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module sub_complemen2;
//-- definir dados
reg [7:0]a;
reg [7:0]b;
reg [7:0]c;
reg [7:0]d;
reg [7:0]e;
//-- parte principal
initial begin
$display("Exercicio0005 - Átila Martins Silva Júnior - 449014");
$display("Subtração usando complementos de 2:");
a = 6'b101010 + (~4'b1001+1);
b = 5'b11011 +(~4'o15+1);
c = 5'o34 +(~4'hC+1);
d = 9'hDA +(~8'b10111001+1);
e = 27 + (~5'h1B+1);
$display("\nResultados nas bases, 10 e 2");
$display("6'b101010 - 4'b1001 = %d = %8b",a,a);
$display("5'b11011 - 4'o18    = %d = %8b",b,b);
$display("5'o34 - 4'hC        = %d = %8b",c,c);
$display("5'hDA - 8'b10111001 = %d = %8b",d,d);
$display("27 - 5'h1B          = %d = %8b",e,e);
end
endmodule// sub_complemen2
