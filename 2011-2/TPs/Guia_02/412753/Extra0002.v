// ------------------------- 
// Extra0002 - BASE 
// Nome: Lu�s Vasconcelos Dias 
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
		$display("Extra0002 - Luis Vasconcelos Dias - 412753"); 
		$display("Teste complemento de 2"); 
		$display("\n~a+1 = s\n"); 
		a=0; 
	#1 $display("~%b = %b", a+1, s); 
		a=1; 
	#1 $display("~%b = %b", a+1, s); 
	
	end 
	endmodule // test_base 
	
// ------------------------- testes

/*
	Teste complemento de 2
	
	~a+1 = s
	
	~00000000000000000000000000000001 = 1
	~00000000000000000000000000000010 = 0
*/