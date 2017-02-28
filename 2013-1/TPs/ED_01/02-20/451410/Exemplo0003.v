//...............
//Exemplo0003 - AND
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//.. end gate
//...............
module notgate(output s, input p, input q);
assign s = p&q;
endmodule // andgate

//...............
//.. test and gate
//...............
module testandgate;
//...............dados locais
reg a,b;//definir registrador
      //(variavel indepedente)
wire s;//definir conexao(fio)
       //(variavel depemdente)
//................instancia
notgate AND1(s,a,b);
//................preparacao
initial begin:start
//atribuicao simultanea
a=0; b=0;//valores iniciais
end
//..............parte principal
initial begin:main
$display("Exemplo0003 - Mateus Lima Batista - 451410");
$display("Test AND gate");
$display("\na&b=s\n");
a = 0;b = 0;
$monitor("%b & %b = %b", a, b, s);
#1 a = 0; b = 1;
#1 a =1; b = 0;
#1 a = 1; b = 1;
end
endmodule //testandgate

