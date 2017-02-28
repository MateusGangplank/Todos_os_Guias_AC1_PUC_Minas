// -------------------------
// Exercicio07 - XNOR (ab+a’b’)
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------


//-------------------
//--  Porta XNOR
//-------------------
module porta_xnor_expressao (output s, input p, input q);

assign s =((p&q)|((~p)&(~q))) ;

endmodule   //xnor

//--------------------
//--test porta xnor
//--------------------

module test_porta_xnor;

//--------------dados locais
	reg a, b;			//definir registrador
	wire s;				//definir conexao(fio)
	
//-----------instancia
porta_xnor_expressao XNOR2(s, a, b);

//------------------preparacao
initial begin:start
	a=0; b=0;
end

//----------------parte principal
initial begin:main
   $display("Exercicio07 - Thais Mairink - 441710");
	$display("Test porta_nor");
	$display("\n((a&b)|((~a)&(~b))) =  s\n");
   $monitor("%b ~^ %b = %b", a, b, s);
#1	a=0; b=0;
#1	a=0; b=1;
#1	a=1; b=0;
#1	a=1; b=1;

end

endmodule  //test_porta_xnor

