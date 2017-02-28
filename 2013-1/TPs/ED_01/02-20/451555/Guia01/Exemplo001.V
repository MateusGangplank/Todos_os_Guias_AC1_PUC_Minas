//----------------
//Exemplo001-buffer
//Nome:Filipe Santos
//Matricula:451555
//----------------

//----------------
//--buffer
//----------------
module buffer(output s, input p);
assign s=p;//criar vinculo permanente
//dependencia
endmodule//buffer
//----------------
//--test buffer
//----------------
module testbuffer;
//----------------dados locais
reg a;  //definir registrador
        //variavel independente
wire s; //definir conexao(fio)
        //(variavel dependente)
//---------------instancia
buffer BF1(s, a);
//---------------preparacão
initial begin:start
a=0;//valor inicial
end
//--------------parte principal
initial begin:main
//execucão unitaria
$display("Exemplo0001-Filipe Santos-451555");
$display("Teste buffer:");
$display("\t time\ta=s");
// execucao permanente
$monitor("%d\t%b= %b",$time,a,s);
// apos uma unidade de tempo
// mudar o valor do registrador para 0
#1 a=1;
// apos duas unidades de tempo
// mudar o valor do registrador para 1
#2 a=0;
end
endmodule //testbuffer