// -------------------------------------------------
// -- Exemplo001 - 	buffer
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -------------------------------------------------

// -------------------------------------------------
// -- buffer
// -------------------------------------------------
	module buffer(output s, input p);
	
		assign s = p; 	// -- criar vinculo permanente()
							// -- ( dependencia )
	endmodule //-- buffer

// -------------------------------------------------
// -- testar o buffer
// -------------------------------------------------

	module testbuffer;
		// -- Dados locais
			reg a; 	// -- definir registrador
					 	// -- variavel independente
			wire s;	// -- definir conexao( fio )
					 	// -- variavel dependente
		// ---------------------------------------
		// -- instancia
		// ---------------------------------------
			buffer BF1(s, a);
			
		// ---------------------------------------
		// -- preparacao
		// ---------------------------------------
			initial begin: start
				a = 0;	// -- valor incial
			end
		// ---------------------------------------
		// -- parte principal
		// ---------------------------------------
			initial begin: main
			// -- execucao unitaria
				$display("Exemplo001 Sad - 440265");
				$display("Test buffer:");
				$display("\t time \ta = s");	
			//	-- execucao permanente
				$monitor("%d\t%b = %b", $time, a, s);
			// -- apos uma unidade de tempo 
			// --	mudar o valor do registrador para 0
			#1 a = 1;
			//	-- Apos duas unidades de tempo
			// -- mudar o valor do registrador para 1
			#2 a = 0;
			end
	endmodule // -- testbuffer
			 