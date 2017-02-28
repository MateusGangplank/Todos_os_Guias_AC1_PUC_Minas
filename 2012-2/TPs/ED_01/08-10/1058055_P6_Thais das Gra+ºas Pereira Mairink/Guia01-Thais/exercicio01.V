// -------------------------
// Exercicio01 - NAND
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------


//-------------------
//--  Porta NAND
//-------------------
module porta_nand (output s, input p, input q);

assign s = (~(p&q));

endmodule  //nand

//---------------
//--test porta_nand
//------------------

module test_porta_nand;

//-----------dados locais
	reg a, b;  //definir registradores
	wire s;    //definir conexao(fio)

//-----------------instancia
porta_nand NAND1(s, a, b);

//------------------preparacao
initial begin : start
	a=0; b=0;    //inicializacao simultanea
end

//-----------parte principal
initial begin: main
	$display("Exercicio01 - Thais Mairink - 441710");
	$display("Test porta_nand");
	$display("\n(~(a&b)) = s\n");
	
	a=0; b=0;
#1 $display("%b ~& %b = %b", a, b, s);
	a=0; b=1;
#1 $display("%b ~& %b = %b", a, b, s);
	a=1; b=0;
#1 $display("%b ~& %b = %b", a, b, s);
	a=1; b=1;
#1 $display("%b ~& %b = %b", a, b, s);	

end

endmodule  //test_prta_nand