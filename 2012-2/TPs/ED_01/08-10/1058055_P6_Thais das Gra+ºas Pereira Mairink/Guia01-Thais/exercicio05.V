// -------------------------
// Exercicio05 - NOR (de Morgan)
// Nome: Thais Mairink
// Matricula: 441710
//-------------------------


//-------------------
//--  Porta NOR(de Morgan)
//-------------------
module nor_deMorgan (output s, input p, input q);

assign s = (~p&~q) ;				//NOR (De Morgan)	
	
endmodule   //nor

//--------------------
//--test porta nor(de morgan)
//--------------------

module test_nor_deMorgan;

//--------------dados locais
	reg a, b;			//definir registrador
	wire s;				//definir conexao(fio)
	
//-----------instancia
nor_deMorgan NORM1(s, a, b);

//------------------preparacao
initial begin:start
	a=0; b=0;
end

//----------------parte principal
initial begin:main
   $display("Exercicio05 - Thais Mairink - 441710");
	$display("Test nor_deMorgan");
	$display("\n(~a&~b) =  s\n");
   $monitor("%b ~| %b = %b", a, b, s);
#1	a=0; b=0;
#1	a=0; b=1;
#1	a=1; b=0;
#1	a=1; b=1;

end

endmodule  //test_nand_deMorgan