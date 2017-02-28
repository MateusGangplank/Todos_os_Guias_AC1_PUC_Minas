// Exemplo0001 - buffer 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- buffer 
// ------------------------- 
module buffer (output s, input p); 
	assign s = p; 
endmodule // buffer 

// ------------------------- 
// -- test buffer 
// ------------------------- 
module testbuffer; 
	reg a; // definir registrador 
	wire s; // definir conexao (fio) 
	buffer BF1 (s, a); 
	initial begin:start 
		a=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exemplo 0001 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test buffer:"); 
		$display("\t\ttime\ta = s"); 
	
		$monitor("%d\t%b = %b", $time, a, s); 
		#1 a=1; 
		#2 a=0; 
	end 
endmodule 