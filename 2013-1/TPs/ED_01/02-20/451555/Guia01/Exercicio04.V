//-------------
//Exercicio04//NAND
//Nome:Filipe Santos
//Matricula:455155
//-------------
//----------

//----------
//--nand gate(deMorgan)
//----------

module nandgate(output s,input p,input q);
assign s=(~p|~q);//---(deMorgan)
endmodule//nandgate

//----------
//--test nand gate
//----------

module testnandgate;
//dados locais
reg a,b; //definir registradores
wire s;  //definir conexao(fio)

nandgate NAND1(s,a,b);
//preparacao
initial begin:start
//atribuicao simultanea
//dos valores iniciais 
a=0;b=0;
end
//-------parte principal
initial begin:main
$display("Exercicio04-Filipe Santos-451555");
$display("Test NAND gate");
$display("\n~(a&b)=s\n");
$monitor("%b ~& %b = %b",a,b,s);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule//testnandgate