// ------------------------- 
// Exemplo0002 - NOT 
// Nome:Douglas Cruz de Matos 
// Matricula: 433134
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
	module notgate (output s, input p); 
		assign s = ~p; 
	endmodule // notgate 

// ------------------------- 
// -- test not gate 
// ------------------------- 
	module testnotgate; 
// ------------------------- dados locais 
		reg a; // definir registrador
		// (variavel independente) 
		wire s; // definir conexao (fio)
		//(variavel dependente ) 
// ------------------------- instancia 
		notgate NOT1 (s, a); 
// ------------------------- preparacao 
		initial begin:start 
			a=0; 
		end 
// ------------------------- parte principal 
		initial begin 
			$display("Exemplo0002 - Douglas Cruz de Matos - 433134"); 
			$display("Testando a porta NOT"); 
			$display("\n~a = s\n"); 
			a=0; 
			#1 $display("~%b = %b", a, s); 
			a=1; 
			#1 $display("~%b = %b", a, s); 
		end 
	endmodule // testnotgate 