// ------------------------- 
// Exercicio0007 - XNOR	
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 

// ------------------------- 
// -- xnor gate 
// ------------------------- 
	module xnorgate ( output s, 
	input p, q); 
	assign s =  p&q | ~p&~q ; 
	endmodule // xnorgate 

// --------------------- 
// -- test xnor gate 
// --------------------- 
	module testxnorgate; 

// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 

// ------------------------- instancia 
	xnorgate XNOR1 (s, a, b); 

// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0; b=0; 
end 

// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0006 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test XNOR gate"); 
	$display("\na&b | ~a&~b = s\n"); 
		a=0; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testxnorgate 