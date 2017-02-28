// ------------------------- 
// Exercicio0005 - NOR	
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 

// ------------------------- 
// -- nor gate 
// ------------------------- 
	module norgate ( output s, 
	input p, q); 
	assign s = ~p & ~q; 
	endmodule // norgate 

// --------------------- 
// -- test nor gate 
// --------------------- 
	module testnorgate; 

// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 

// ------------------------- instancia 
	norgate NOR1 (s, a, b); 

// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0; b=0; 
end 

// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0005 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test NOR gate"); 
	$display("\n ~a & ~b = s\n"); 
		a=0; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate 