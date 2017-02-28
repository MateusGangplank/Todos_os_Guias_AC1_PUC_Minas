// -------------------------
// Exercicio08 - AND / 3 ENTRADAS
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//-------------------
//---Porta AND com 3 entradas
//-------------------

module and_tresEntradas (output s, input p, input q, input w);

assign s = p & q & w;

endmodule  //and 3 entradas

//----------------------
//--test and 3 entradas
//------------------------
module tes_and_tresEntradas;
//--------------dados locais
	reg a, b, c  ;   //definir registradores
	wire s;           //definir conexao(fio)

//------------instancia
and_tresEntradas AND3 (s,a,b,c);

//------------preparacao
initial begin: start  //atribuicao simultanea dos valores iniciais

a=0; b=0; c=0; 
end

//---------------parte principal
initial begin:main
	$display("Exercicio08 - Thais Mairink - 441710");
	$display("Test AND 3 entradas");
	$display("\na & b & c  =  s\n");
   $monitor("%b & %b & %b  = %b", a, b, c, s);
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1; 
#1 a=1; b=1; c=0; 
#1 a=1; b=1; c=1;

end

endmodule //AND 3 entradas
