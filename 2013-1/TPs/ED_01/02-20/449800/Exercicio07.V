//------------
//Exercicio07//XNOR
//Nome:Filipe Santos
//Matricula:451555
//-----------

//----------
//--XNORgate
//----------

module xnorgate(output s,input p,input q);
assign s=((p&q)|(~p&~q));
endmodule//xnor
//----------
//--test xnorgate
//----------
module testxnorgate;
//----------dados locais
reg a,b;//definir registrador
wire s;//definir conexao(fio)
//-----------instancia
xnorgate XNOR1(s,a,b);
//-----------preparacão
initial begin:start
a=0;b=0;
end
//--------parte principal
initial begin:main
$display("Exercicio07-Filipe Santos-451555");
$display("Test XNOR gate");
$display("\n a.b|a'.b' =s \n");
$monitor(" %b~^%b=%b",a,b,s);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule//testxnorgate
