//-------------
//Exercicio08//AND
//Nome:Filipe Santos
//Matricula:451555
//-------------

//-------------
//--andgate
//-------------

module andgate(output s,input p,input q,input r);
assign s=(p&q&r);
endmodule//and

//-------------
//--test andgate
//-------------
module testandgate;
//-------dados locais
reg a,b,c;
wire s;
//---------instancia
andgate AND1(s,c,a,b);
//---------preparacao
initial begin:start
a=0;b=0;c=0;
end
//---------parte principal
initial begin:main
$display("Exercicio08-Filipe Santos-451555");
$display("test andgate");
$display("a.b.c=s");
$monitor("%b&%b&%b=%b",a,b,c,s);
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end
endmodule//testandgate