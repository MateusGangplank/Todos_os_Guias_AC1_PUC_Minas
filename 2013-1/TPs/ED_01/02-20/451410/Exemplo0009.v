//...............
//Exemplo0009 - NAND Morgan
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//..gate
//...............
module nandmorgangate(output s, input p, input q);
assign s = ((~p)|(~q));
endmodule

//...............
//.. test
//...............
module testnandmorgangate;
//...............dados locais
reg a,b;//definir registrador
      //(variavel indepedente)
wire s;//definir conexao(fio)
       //(variavel depemdente)
//................instancia
nandmorgangate nandmorgan1(s,a,b);
//................preparacao
initial begin:start
//atribuicao simultanea
a=0; b=0;//valores iniciais
end
//..............parte principal
initial begin:main
$display("Exemplo0009 - Mateus Lima Batista - 451410");
$display("Test NAND Morgan gate");
$display("\n(~a)|(~b) = s\n");
a = 0;b = 0;
$monitor("(~%b) | (~%b) = %b", a, b, s);
#1 a = 0; b = 1;
#1 a =1; b = 0;
#1 a = 1; b = 1;
end
endmodule

