// ----------------------------------------
// Exemplo0003 - AND
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- and gate
// -------------------------

module andgate(output s, input p, input q);
	assign s = p & q; //-- vinculo
endmodule //-- end module andgate

// -------------------------
// -- test and gate
// -------------------------

module testandgate;
//-- dados locais
	reg a, b; //-- reg = registrador = entrada
	wire s; //-- wire = sa�da
	
//-- instanciando o "module and gate"
	andgate AND1(s, a, b);
	
//-- prepara��o
	initial begin:start
		a = 0; b = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execu��o 1 � 1
		$display("Exemplo0003 - Jo�o Henrique - 392734");
		$display("Test AND gate");
		$display("\na & b = s\n");
		
		a = 0; b = 0;
	#1 $display("%b & %b = %b", a, b, s);
		a = 0; b = 1;
	#1 $display("%b & %b = %b", a, b, s);
		a = 1; b = 0;
	#1 $display("%b & %b = %b", a, b, s);
		a = 1; b = 1;
	#1 $display("%b & %b = %b", a, b, s);
	
	end //-- end main

endmodule //-- end testandgate