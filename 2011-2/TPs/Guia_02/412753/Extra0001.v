// ------------------------- 
// Extra0001 - BASE Exemplo0011.v
// Nome: Luís Vasconcelos Dias 
// Matricula: 412753 
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
			  // (variavel dependente ) 
// ------------------------- instancia 
	notgate NOT1 (s, a); 
// ------------------------- preparacao 
	initial begin:start 
	a=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Extra0001 - Luís Vasconcelos Dias - 412753"); 
		$display("Teste complemento de 1"); 
		$display("\n~a = s\n"); 
		a=0; 
	#1 $display("~%b = %b", a, s); 
		a=1; 
	#1 $display("~%b = %b", a, s); 

	end 

	endmodule // test_base 
	
// ------------------------- testes

/*
	Teste complemento de 1
	
	~a = s
	
	~0 = 1
	~1 = 0
*/