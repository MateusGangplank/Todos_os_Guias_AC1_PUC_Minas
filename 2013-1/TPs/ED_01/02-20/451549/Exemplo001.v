// ----------------------------------------------------
// Exemplo0001 - buffer
// Nome: Débora Deslandes de Almeida
// Matricula: 451549
// ----------------------------------------------------
//
// ----------------------------------------------------
// -- buffer
// ----------------------------------------------------
	module buffer (output s, input p);
		assign s = p; //vinculo permanente (dependencia)
	endmodule // buffer
//	
// ----------------------------------------------------
// -- testbuffer
// ----------------------------------------------------
	module testbuffer;
		// --------------------------------- dados locais
		reg a; //registrador (independente)
		wire s; //conexao -> fio 
				  // (variavel dependente
		// ------------------------------------ instancia
		buffer banana (s,a);
		// ----------------------------------- preparacao
		initial begin: start
			a = 0; //valor inicial
		end
		// ------------------------------ parte principal
		initial begin: main
			//execuao unitaria(imprime somente uma vez)
			$display ("\nExemplo 001 - Debora Deslandes de Almeida Batista");
			$display ("\nMatricula: 451549");
			$display ("\nTeste buffer");
			$display ("\n\t\t\tTime\ta = s");
			//execucao permanete - imprime sempre que mudar o valor da entrada ou da saida
			$monitor ("\n\t%d\t%b = %b" , $time,a,s);
				//apos x unidades de tempo
				#1 a = 1;
				#2 a = 0;
		end
	endmodule // testbuffer
				