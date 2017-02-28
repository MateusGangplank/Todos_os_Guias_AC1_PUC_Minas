//Exercicio00006 COMPLEMENTO1
//Nome: Átila Martins Silva Júnior
//Matrícula: 449014
//--------------------------------
//number system
//------------------------------
module complemento1(input[7:0] a,
output[7:0] b);
//-- definir dados
assign b = ~a;
endmodule// complemento1

//--teste complemento1
module testcomplemento1;

//--dados locais
reg [7:0]p;
wire [7:0]q;

//--instancia
complemento1 COMP1 (p,q);

//--atribuição
initial begin
p = 8'b10001101;
end

//-- parte principal
initial begin
$display("Exercicio0006 - Átila Martins Silva Júnior - 449014");
$display("Complemento de 1:");
$monitor("~%8b = %8b",p,q);
#1 p = 8'b10101010;
#1 p = 8'b11111111;
#1 p = 8'b11101100;
#1 p = 8'b00000000;
#1 p = 8'b11100011;
end
endmodule// complemento1
