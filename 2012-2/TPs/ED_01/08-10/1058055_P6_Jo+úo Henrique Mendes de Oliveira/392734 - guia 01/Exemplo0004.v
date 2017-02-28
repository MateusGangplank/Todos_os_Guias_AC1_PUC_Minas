// ----------------------------------------
// Exemplo0004 - OR
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- or gate
// -------------------------

module orgate(output s, input p, q);
	assign s = p | q; //-- vinculo
endmodule //-- end module orgate

// -------------------------
// -- test or gate
// -------------------------

module testorgate;
//-- dados locais
	reg a, b; //-- reg = registrador = entrada
	wire s; //-- wire = sa�da
	
//-- instanciando o "module or gate"
	orgate OR1(s, a, b);
	
//-- prepara��o
	initial begin:start
		a = 0; b = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execu��o 1 � 1
		$display("Exemplo0004 - Jo�o Henrique - 392734");
		$display("Test OR gate");
		$display("\na | b = s\n");
		
		a = 0; b = 0;
	#1 $display("%b | %b = %b", a, b, s);
		a = 0; b = 1;
	#1 $display("%b | %b = %b", a, b, s);
		a = 1; b = 0;
	#1 $display("%b | %b = %b", a, b, s);
		a = 1; b = 1;
	#1 $display("%b | %b = %b", a, b, s);
	
	end //-- end main

endmodule //-- end testorgate