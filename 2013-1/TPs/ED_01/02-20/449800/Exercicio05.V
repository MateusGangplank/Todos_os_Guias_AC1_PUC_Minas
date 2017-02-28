//---------
//Exercicio05-NOR
//Nome:Filipe Santos
//Matricula:451555
//---------

//---------
//--norgate(deMorgan)
//---------

module norgate(output s,input p,input q);
assign s=(~p&~q);//--(deMorgan)
endmodule//NOR
//----------
//--test norgate
//----------
module testnorgate;
//------dados locais
reg a,b;//definir registradores
wire s;//definir conexao(fio)
//------instancia
norgate NOR1(s,a,b);
//------preparacao
initial begin:start
a=0;b=0;
end
//-------parte principal
initial begin:main
$display("Exercicio05-Filipe Santos-451555");
$display("Test NOR gate");
$display("\n ~(a|b)=s \n");
$monitor("%b~|%b = %b",a,b,s);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule//testnorgate