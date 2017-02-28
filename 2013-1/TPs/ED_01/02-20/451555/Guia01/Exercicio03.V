//---------------
//Exercicio03//XNOR
//Nome:Filipe Santos
//Matricula:451555
//---------------

//---------------
//--xnorgate
//---------------

module xnorgate(output s,input p,input q);
assign s=~(p^q);
endmodule//xnor
//---------------
//--test xnorgate
//---------------

module testxnorgate;
//---------------dados locais
reg a,b; //definir registradores
wire s;  //definir conexao(fio)

xnorgate XNOR1(s,a,b);
//---------------preparacao
initial begin:start
a=0;b=0;
end
//--------------parte principal
initial begin:main
$display("Exercicio03-Filipe Santos-451555");
$display("Test xnorgate");
$display("\n a ~^ b = s \n");
$monitor("%b~^%b=%b",a,b,s);
#1 a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule//testxnorgate
