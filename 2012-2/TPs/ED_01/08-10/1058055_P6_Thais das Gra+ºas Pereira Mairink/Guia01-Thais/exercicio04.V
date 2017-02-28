// -------------------------
// Exercicio04 - NAND (de Morgan)
// Nome: Thais Mairink
// Matricula: 441710
//-------------------------


//-------------------
//--  Porta NAND(de Morgan)
//-------------------
module nand_deMorgan (output s, input p, input q);

assign s = (~p|~q) ;				//NAND (De Morgan)	
	
endmodule   //nand

//--------------------
//--test porta nand(de morgan)
//--------------------

module test_nand_deMorgan;

//--------------dados locais
	reg a, b;			//definir registrador
	wire s;				//definir conexao(fio)
	
//-----------instancia
nand_deMorgan NANDM1(s, a, b);

//------------------preparacao
initial begin:start
	a=0; b=0;
end

//----------------parte principal
initial begin:main
   $display("Exercicio04 - Thais Mairink - 441710");
	$display("Test nand_deMorgan");
	$display("\n(~a|~b) =  s\n");
   $monitor("%b ~& %b = %b", a, b, s);
#1	a=0; b=0;
#1	a=0; b=1;
#1	a=1; b=0;
#1	a=1; b=1;

end

endmodule  //test_nand_deMorgan

