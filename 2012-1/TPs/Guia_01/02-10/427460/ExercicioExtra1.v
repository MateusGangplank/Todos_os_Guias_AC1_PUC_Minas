// ------------------------- 
// ExercicioExtra1 - NOR
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 


// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
	module norgate ( output s, 
	input [7:0] p); 
	nor nor1 (s, p); 
	endmodule // norgate 

// --------------------- 
// -- test nor gate 
// --------------------- 
	module testandgate; 

// ------------------------- dados locais 
	reg [7:0] a; // definir registradores 
	wire s; // definir conexao (fio) 
	
// ------------------------- instancia 
	norgate NOR1 (s, a); 

// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=00000000; 
end 
// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0010 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test NOR gate"); 
	
		a=00000000;  
	#1 $display("%b = %b", a, s); 
	
	
	
end 
endmodule // testnorgate 