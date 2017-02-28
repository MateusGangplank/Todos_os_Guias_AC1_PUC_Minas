// -------------------------
// Exercicio08 - AND / 4 ENTRADAS
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//-------------------
//---Porta AND com 4 entradas
//-------------------

module and_quatroEntradas (output s, input p, input q, input r, input w);

assign s = p & q & r & w;

endmodule  //and 4 entradas

//----------------------
//--test and 4 entradas
//------------------------
module tes_and_quatroEntradas;
//--------------dados locais
	reg a, b, c, d;   //definir registradores
	wire s;           //definir conexao(fio)

//------------instancia
and_quatroEntradas AND4 (s,a,b,c,d);

//------------preparacao
initial begin: start  //atribuicao simultanea dos valores iniciais

a=0; b=0; c=0; d=0;
end

//---------------parte principal
initial begin:main
	$display("Exercicio08 - Thais Mairink - 441710");
	$display("Test AND 4 entradas");
	$display("\na & b & c & d =  s\n");
   $monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end

endmodule //AND 4 entradas




