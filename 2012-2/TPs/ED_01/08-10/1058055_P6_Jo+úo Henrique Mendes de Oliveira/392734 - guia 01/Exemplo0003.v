// ----------------------------------------
// Exemplo0003 - AND
// Nome: João Henrique Mendes de Oliveira
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
	wire s; //-- wire = saída
	
//-- instanciando o "module and gate"
	andgate AND1(s, a, b);
	
//-- preparação
	initial begin:start
		a = 0; b = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execução 1 à 1
		$display("Exemplo0003 - João Henrique - 392734");
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