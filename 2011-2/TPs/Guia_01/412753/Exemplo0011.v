// ------------------------- 
// Exemplo0011 - XNOR 
// Nome: Luis Vasconcelos Dias
// Matricula: 412753
// ------------------------- 

// ------------------------- 
// -- xnor gate 
// ------------------------- 
	module xnorgate ( output s, input p, q); 
	assign s = ~(p ^ q); 
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
		a=0; b=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0011 - Luis Vasconcelos Dias - 412753"); 
		$display("Test XNOR gate"); 
		$display("\na ^ b = s\n"); 
		a=0; b=0; 
	#1 $display("%b ^ %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b ^ %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b ^ %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b ^ %b = %b", a, b, s); 
	end 

endmodule // testxnorgate 

// ------------------------- testes

/*
	Test XNOR gate
  
 	a ^ b = s
  
  	0 ^ 0 = 1 // retorna 1 se todos os bits forem iguais a 0
  	0 ^ 1 = 0
  	1 ^ 0 = 0
  	1 ^ 1 = 1
*/