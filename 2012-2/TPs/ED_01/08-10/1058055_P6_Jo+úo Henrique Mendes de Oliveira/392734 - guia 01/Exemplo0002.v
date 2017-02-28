// ----------------------------------------
// Exemplo0002 - NOT
// Nome: João Henrique Mendes de Oliveira
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
	wire s; //-- wire = saída
	
//-- instanciando o "module not gate"
	notgate NOT1(s, a);
	
//-- preparação
	initial begin:start
		a = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execução 1 à 1
		$display("Exemplo0002 - João Henrique - 392734");
		$display("Test NOT gate");
		$display("\n~a = s\n"); //-- \n =
		
		a = 0;
	#1 $display("~%b = %b", a, s);
		a = 1;
	#1 $display("~%b = %b", a, s);
	
	end //-- end main

endmodule //-- end testnotgate