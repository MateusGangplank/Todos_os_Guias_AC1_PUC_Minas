// ----------------------------------------------------------------------------------------
// Exemplo0003 - AND
// Nome: Débora Deslandes de Almeida
// Matricula: 451549
// ----------------------------------------------------------------------------------------
//
// ----------------------------------------------------------------------------------------
// -- buffer
// ----------------------------------------------------------------------------------------
	module buffer (output s, input p);
		assign s = p; //vinculo permanente (dependencia)
	endmodule // buffer
//	
// ----------------------------------------------------------------------------------------
// -- testbuffer
// ----------------------------------------------------------------------------------------
	module testbuffer;
		// --------------------------------------------------------------------- dados locais
		reg a; //registrador (independente)
		wire s; //conexao -> fio 
				  // (variavel dependente
		// ------------------------------------------------------------------------ instancia
		buffer banana (s,a);
		// ----------------------------------------------------------------------- preparacao
		initial begin: start
//			a = 0; //valor inicial
		end
		// ------------------------------------------------------------------- parte principal
		initial begin: main
			//execuao unitaria(imprime somente uma vez)
//			$display ("\nExemplo 001 - Debora Deslandes de Almeida Batista");
//			$display ("\nMatricula: 451549");
//			$display ("\nTeste buffer");
//			$display ("\n\t\t\tTime\ta = s");
			//execucao permanete - imprime sempre que mudar o valor da entrada ou da saida
//			$monitor ("\n\t%d\t%b = %b" , $time,a,s);
				//apos x unidades de tempo
//				#1 a = 1;
//				#2 a = 0;
		end
	endmodule // testbuffer
	
// -----------------------------------------------------------------------------------------
// -- not gate
// -----------------------------------------------------------------------------------------
	module notgate ( output s, input p);
		assign s = ~p;
	endmodule // notgate
	
// -----------------------------------------------------------------------------------------
// -- test not gate
// -----------------------------------------------------------------------------------------
	module testnotgate;
	// ------------------------------------------------------------------------- dados locais
	reg a;
	wire s;
	// ---------------------------------------------------------------------------- instancia
	notgate uva (s,a);
	// --------------------------------------------------------------------------- preparacao
	initial begin : start
//		a = 0; //valor inicial
	end
	// ---------------------------------------------------------------------- parte principal
	initial begin
//		$display ("Exemplo 002 - Debora Deslandes de Almeida Batista");
//		$display ("Matricula: 451549");
//		$display ("Teste NOT gate");
//		$display ("\n~a = s\n");
//		a = 0;
//		#1 $display ("~%b = %b", a, s);
//			a = 1;
//		#1 $display ("~%b = %b", a, s);
	end
endmodule // testnotgate

// -----------------------------------------------------------------------------------------
// -- and gate
// -----------------------------------------------------------------------------------------

module andgate (output s, input q, input p);
	assign s = p&q;
endmodule // andgate

// -----------------------------------------------------------------------------------------
// -- test and gate
// -----------------------------------------------------------------------------------------
module testandgate;
	// ------------------------------------------------------------------------- dados locais
	reg a,b;
	wire s;
	// ---------------------------------------------------------------------------- instancia
	andgate morango (s,a,b);
	// --------------------------------------------------------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
	// ---------------------------------------------------------------------- parte principal
	initial begin
		$display ("Exemplo 0003 - Debora Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test AND gate");
		$display ("\na & b = s\n");
		a = 0;
		b = 0;
		$monitor ("%b & %b = %b", a,b,s);
			#1 a = 0; b = 0;
			#1 a = 1; b = 0;
			#1 a = 1; b = 1;
	end
endmodule // testandgate