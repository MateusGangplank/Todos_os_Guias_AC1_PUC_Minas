//...............
//Exemplo0004 - OR
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//.. or gate
//...............
module orgate(output s, input p, input q);
assign s = p|q;
endmodule // orgate

//...............
//.. test or gate
//...............
module testorgate;
//...............dados locais
reg a,b;//definir registrador
      //(variavel indepedente)
wire s;//definir conexao(fio)
       //(variavel depemdente)
//................instancia
orgate OR1(s,a,b);
//................preparacao
initial begin:start
//atribuicao simultanea
a=0; b=0;//valores iniciais
end
//..............parte principal
initial begin:main
$display("Exemplo0004 - Mateus Lima Batista - 451410");
$display("Test OR gate");
$display("\na|b=s\n");
a = 0;b = 0;
$monitor("%b | %b = %b", a, b, s);
#1 a = 0; b = 1;
#1 a =1; b = 0;
#1 a = 1; b = 1;
end
endmodule //testandgate

