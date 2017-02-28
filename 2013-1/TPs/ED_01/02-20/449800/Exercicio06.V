//---------
//Exercicio06//XOR
//Nome:Filipe Santos
//Matricula:451555
//---------

//---------
//--xorgate(deMorgan)
//---------

module xorgate(output s,input p,input q);
assign s = ((~p&q)|(p&~q));
endmodule//xor

//----------
//--test xorgate
//----------

module testnorgate;
//-------dados locais
reg a,b;//definir registradores
wire  s;//definir conexao(fio)
//-------instancia
xorgate XOR1(s,a,b);
//-------preparacao
initial begin:start
a=0;b=0;
end
//------parte principal
initial begin:main
$display("Exercicio06-Filipe Santos-451555");
$display("Test xorgate");
$display("\n ((a&~b)|(a&~b)) \n");
$monitor("%b^%b = %b",a,b,s);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule//testxorgate