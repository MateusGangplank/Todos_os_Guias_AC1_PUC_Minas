// ------------------------- 
// Exemplo0007 - NOR 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// -- nor gate 
// ------------------------- 
	module norgate ( output s, input p, q); 
	assign s = ~(p | q); 
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
		a=0; b=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0007 - Guilherme Terra - 427407"); 
		$display("Test NOR gate"); 
		$display("\na ~| b = s\n"); 
		a=0; b=0; 
	#1 $display("%b ~| %b = %b", a, b, s); 
		a=0; b=1; 
	#1 $display("%b ~| %b = %b", a, b, s); 
		a=1; b=0; 
	#1 $display("%b ~| %b = %b", a, b, s); 
		a=1; b=1; 
	#1 $display("%b ~| %b = %b", a, b, s); 
	end 

endmodule // testnorgate 

// ------------------------- testes

/*
 Test NOR gate
 
 a ~| b = s
 
 0 ~| 0 = 1
 0 ~| 1 = 0
 1 ~| 0 = 0
 1 ~| 1 = 0
*/