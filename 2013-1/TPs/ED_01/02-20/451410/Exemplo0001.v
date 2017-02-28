//.................
//Exemplo0001-buffer
//Nome:Mateus Lima Batista
//Matricula:451410
//.................

//.................
//--buffer
//.................
module buffer(output s,input p);
assign s = p;//criar vinculo permanente
	 //(dependencia)
endmodule//buffer

//................
//--test buffer
//................
module testbuffer;
//................dados locais
reg a; //definir
       //(variavel indepedente)
wire s; //definir conexao(fio)
	//(varivel depedente)
//...............instancia
buffer BF1 (s,a);
//...............preparacao
initial begin:start
a=0;//valor inicial
end
//..............parte principal
initial begin:main
//execucao permanente
$display("Exemplo 0001-Mateus Lima Batista-451410");
$display("Test buffer:");
//execucao permanente
$monitor("%d\t%b=%b",$time,a,s);
//apos uma unidade de tempo
//mudar valor do registrador para 1
#1 a=1;
//apos duas unidades de tempo
//mudar valor do registrador para 0
#2 a=0;
end
endmodule//testbuffer
