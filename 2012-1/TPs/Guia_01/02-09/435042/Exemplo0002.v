// ------------------------- 
// Exemplo0002 - NOT 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// ------------------------- 
// Altera��es feitas:
// Troquei o buffer pela porta NOT.
// Em vez de usar $monitor, esse programa usa $display.
// Previs�o:
// A sa�da � a nega��o da entrada.
// Teste 1:
// Entradas: a=0 e a=1.
// Observa��es da sa�da:
// A sa�da � uma tabela verdade da nega��o.
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
	reg a;  // definir registrador 
	        // (variavel independente) 
	wire s; // definir conexao (fio) 
	        // (variavel dependente ) 
	// ------------------------- instancia 
	notgate NOT1 (s, a); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0; 
	end 
	// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0002 - Daniel Telles McGinnis  - 435042"); 
		$display("Test NOT gate"); 
		$display("\n~a = s\n"); 
		a=0; 
		#1 $display("~%b = %b", a, s); 
		a=1; 
		#1 $display("~%b = %b", a, s); 
	end 
endmodule // testnotgate 