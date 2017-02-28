//----------
//Exercicio01-nand
//Nome:Filipe Santos
//Matricula:451555
//----------

//----------
//--nand gate
//----------

module nandgate(output s,input p,q);
assign s=~(p&q);
endmodule//nandgate
//----------
//--test nand gate
//----------
module testnandgate;
//dados locais
reg a,b; //definir registradores
wire s;  //definir conexao(fio)
nandgate NAND1(s,a,b);
initial begin:start
a=0;b=0;
end
//-------parte principal
initial begin
$display("Exercicio01-Filipe Santos-451555");
$display("Test NAND gate");
$display("\n~(a&b)=s\n");
a=0;b=0;
#1 $display("%b & %b =%b",a,b,s);
a=0; b=1;
#1 $display("%b & %b =%b",a,b,s);
a=1;b=0;
#1 $display("%b & %b =%b",a,b,s);
a=1;b=1;
#1 $display("%b & %b =%b",a,b,s);
end
endmodule//testnandgate