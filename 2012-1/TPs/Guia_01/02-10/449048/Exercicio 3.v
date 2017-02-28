// ------------------------- 
// Exercicio 0003 
// Nome: Miller 
// Matricula: 449048 
// -------------------------
// -------- XNOR -----------

module portaXNOR (output o, input x, input y);
assign o = ~(x^y);

endmodule // -- fim do modulo porta XNOR

module principal;
reg v, w; // -- registradores, entrada.
wire s; // -- fio, saida.

portaXNOR seumadruga(s, v, w); // -- ira executar a funcao com os parametros(como se fosse construtor/objeto em java).

initial begin: start
v=0; w=0; // -- atribui os valores iniciais para as variaveis.
end // -- encerrei o initial, que era so pra inicias as variaveis.

initial begin

$display("Miller - 449048");
$display("Porta XNOR");
$display(" ");

$monitor("~( %b ^ %b ) = %b", v, w, s);
// -- ira exibir na tela os dados, mão na roda, pois, nao precisa utilizar 1000 $display toda hora.

#1 // -- nao sera necessario atribuir os valores para as entradas, pois ja utilizei laaaa em cima.
#1 v=1;
#1 v=0; w=1;
#1 v=1;

end
endmodule // -- encerra o modulo principal.
