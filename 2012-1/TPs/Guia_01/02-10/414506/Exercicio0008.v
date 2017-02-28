//Exercicio0008 - and
//Nome:Fernando Silva
//Matricula:414506
//--------------------
//--------------------
//--andgate
//--------------------
module andgate(output [0:3]s,input [0:3] p,input [0:3] q,input[0:3] r);
assign s=((p)&(q)&(r));
endmodule //and
//--------------------
//--test andgate
//--------------------
module testeandgate;
//--------------------dados locais
reg [0:3] a ,b,c;//define registrador
wire [0:3]s;//define conexao(fio)
//--------------------instancia
andgate NOR1(s,a,b,c);
//--------------------preparaçao
initial begin:start
a=4'b0001;//4 valores binarios
b=4'b0101;//4 valores binarios
c=4'b0011;//4 valores binarios
end
//---------------------parte principal
initial begin:main
$display("Exercicio0008- Fernando Silva  - 414506");
$display("Test and gate");
$display("\n a & b & c = s\n");
$monitor("%b & %b & %b = %b",a,b,c,s);
#1 a=0;b=0;c=0; //valores decimais
#1 a=4'b0010;b=4'b0001;c=4'b0011; //valores binarios
#1 a=4'd1;b=3;c=3; //decimal e decimal
#1 a=4'o5;b=2;c=3; //octal e decimal
#1 a=4'hA; b=3;c=4; //hexadecimal e decimal
#1 a=4'h9;b=4'o3;c=3; //hexadecimal e octal
end
endmodule //test andgate