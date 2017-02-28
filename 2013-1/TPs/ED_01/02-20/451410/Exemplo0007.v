//...............
//Exemplo0007 - NOR
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//.. NOR gate
//...............
module norgate(output s, input p, input q);
assign s = (~(p|q));
endmodule

//...............
//.. test
//...............
module testnorgate;
//...............dados locais
reg a,b;//definir registrador
      //(variavel indepedente)
wire s;//definir conexao(fio)
       //(variavel depemdente)
//................instancia
norgate NOR1(s,a,b);
//................preparacao
initial begin:start
//atribuicao simultanea
a=0; b=0;//valores iniciais
end
//..............parte principal
initial begin:main
$display("Exemplo0007 - Mateus Lima Batista - 451410");
$display("Test NOR gate");
$display("\n~(a|b)=s\n");
a = 0;b = 0;
$monitor("~(%b | %b) = %b", a, b, s);
#1 a = 0; b = 1;
#1 a =1; b = 0;
#1 a = 1; b = 1;
end
endmodule

