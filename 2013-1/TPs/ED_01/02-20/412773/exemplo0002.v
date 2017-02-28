// Exemplo0002 - not 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, input p); 
	assign s = ~p; 
endmodule 

// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
	reg a; // definir registrador 
	wire s; // definir conexao (fio) 
	notgate NOT1 (s, a); 
	
	initial begin:start 
		a=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exemplo 0002 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test NOT Gate:"); 
		$display("\n~a = s\n");  
		
		$monitor("~%b = %b", a, s); 
		#1 a=0;
		#1 a=1; 
	end 
endmodule 