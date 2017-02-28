// ----------------------------------------
// Exemplo0002 - NOT
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- not gate
// -------------------------

module notgate(output s, input p);
	assign s = ~p; //-- vinculo
endmodule //-- end module notgate

// -------------------------
// -- test not gate
// -------------------------

module testnotgate;
//-- dados locais
	reg a; //-- reg = registrador = entrada
	wire s; //-- wire = sa�da
	
//-- instanciando o "module not gate"
	notgate NOT1(s, a);
	
//-- prepara��o
	initial begin:start
		a = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execu��o 1 � 1
		$display("Exemplo0002 - Jo�o Henrique - 392734");
		$display("Test NOT gate");
		$display("\n~a = s\n"); //-- \n =
		
		a = 0;
	#1 $display("~%b = %b", a, s);
		a = 1;
	#1 $display("~%b = %b", a, s);
	
	end //-- end main

endmodule //-- end testnotgate