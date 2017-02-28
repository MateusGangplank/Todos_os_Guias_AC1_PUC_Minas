//Exercicio00007 COMPLEMENTO2
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module complemento2(input[7:0] a,
output[7:0] b);
//-- definir dados
assign b = ~a+1;
endmodule// complemento2

//--teste complemento1
module testcomplemento2;

//--dados locais
reg [7:0]p;
wire [7:0]q;

//--instancia
complemento2 COMP2 (p,q);

//--atribuição
initial begin
p = 8'b10001101;
end

//-- parte principal
initial begin
$display("Exercicio0007 - Átila Martins Silva Júnior - 449014");
$display("Complemento de 2:");
$monitor("~%8b+1 = %8b",p,q);
#1 p = 8'b10101010;
#1 p = 8'b11111111;
#1 p = 8'b11101100;
#1 p = 8'b00000000;
#1 p = 8'b11100011;
end
endmodule// complemento2
