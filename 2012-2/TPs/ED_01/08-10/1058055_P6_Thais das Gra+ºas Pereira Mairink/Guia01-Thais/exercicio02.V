// -------------------------
// Exercicio02 - NOR
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//---------------
//--Porta NOR
//---------------

module porta_nor(output s, input p, input q);

assign s = (~(p|q));

endmodule   //nor

//---------------------
//--test porta_nor
//---------------------

module test_porta_nor;

//------------dados locais
	reg a, b;  		//definir registradores
	wire s;			//definir conexao(fio)

//-----------------instancia
porta_nor NOR1(s,a,b);

//-----------------preparacao
initial begin: start
	a=0; b=0;
	
end

//---------------parte principal
initial begin:main
	$display("Exercicio02 - Thais Mairink - 441710");
	$display("Test porta_nor");
	$display("\n(~(a|b)) =  s\n");
   $monitor("%b ~| %b = %b", a, b, s);
#1	a=0; b=0;
#1	a=0; b=1;
#1	a=1; b=0;
#1	a=1; b=1;

end

endmodule  //tes_porta_nor