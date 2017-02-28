//...............
//Exemplo0002 - NOT
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//.. not gate
//...............
module notgate(output s, input p);
assign s = ~p;
endmodule // notgate

//...............
//.. test not gate
//...............
module testnotgate;
//...............dados locais
reg a;//definir registrador
      //(variavel indepedente)
wire s;//definir conexao(fio)
       //(variavel depemdente)
//................instancia
notgate NOT1(s,a);
//................preparacao
initial begin:start
a=0;//valor inicial
end
//..............parte principal
initial begin:main
$display("Exemplo0002 - Mateus Lima Batista - 451410");
$display("Test NOT gate");
$display("\n~a = s\n");
a = 0;
$monitor("~%b = %b", a, s);
#1 a = 1;
end
endmodule //testnotgate

