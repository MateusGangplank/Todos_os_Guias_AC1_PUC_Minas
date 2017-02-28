//Exercicio0005 - nor
//Nome:Fernando Silva
//Matricula:414506
//--------------------
//--------------------
//--norgate
//--------------------
module norgate(output [0:3]s,input [0:3] p,input [0:3] q);
assign s=((~(p))&(~(q)));
endmodule //nor
//--------------------
//--test norgate
//--------------------
module testenorgate;
//--------------------dados locais
reg [0:3] a ,b;//define registrador
wire [0:3]s;//define conexao(fio)
//--------------------instancia
norgate NOR1(s,a,b);
//--------------------preparaçao
initial begin:start
a=4'b0001;//4 valores binarios
b=4'b0101;//4 valores binarios
end
//---------------------parte principal
initial begin:main
$display("Exercicio0005- Fernando Silva  - 414506");
$display("Test nor gate");
$display("\n a | b = s\n");
$monitor("%b | %b = %b",a,b,s);
#1 a=0;b=0; //valores decimais
#1 a=4'b0010;b=4'b0001; //valores binarios
#1 a=4'd1;b=3; //decimal e decimal
#1 a=4'o5;b=2; //octal e decimal
#1 a=4'hA; b=3; //hexadecimal e decimal
#1 a=4'h9;b=4'o3; //hexadecimal e octal
end
endmodule //test norgate