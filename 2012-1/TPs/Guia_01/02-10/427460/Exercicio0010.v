// ------------------------- 
// Exercicio0010 - OR	
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 


// ------------------------- 
// -- or gate 
// ------------------------- 
	module orgate ( output s, 
	input p, 
	input q); 
	assign s = p | q ; 
	endmodule // orgate 

// --------------------- 
// -- test or gate 
// --------------------- 
	module testorgate; 

// ------------------------- dados locais 
	reg a, b, c; // definir registradores 
	wire s, s1; // definir conexao (fio) 
	
// ------------------------- instancia 
	orgate OR1 (s1, a, b); 
	orgate OR2 (s, s1, c);
	
// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0010 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test OR gate"); 
	$display("\na |  b | c = s\n"); 
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
endmodule // testorgate 		