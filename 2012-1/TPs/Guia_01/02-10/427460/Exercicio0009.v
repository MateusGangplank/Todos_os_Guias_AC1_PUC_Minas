// ------------------------- 
// Exercicio0009 - AND	
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 


// ------------------------- 
// -- and gate 
// ------------------------- 
	module andgate ( output s, 
	input p, 
	input q); 
	assign s = p & q ; 
	endmodule // nandgate 

// --------------------- 
// -- test and gate 
// --------------------- 
	module testandgate; 

// ------------------------- dados locais 
	reg a, b, c; // definir registradores 
	wire s, s1; // definir conexao (fio) 
	
// ------------------------- instancia 
	andgate AND1 (s1, a, b); 
	andgate AND2 (s, s1, c);
	
// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0009 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test AND gate"); 
	$display("\na &  b & c = s\n"); 
		a=0; b=0; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=0; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=0; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=0; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
end 
endmodule // testandgate 			