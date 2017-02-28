
// ------------------------- 
// Exemplo0007 - nor
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460
// ------------------------- 

// ------------------------- 
// -- nor gate 
// ------------------------- 
	module norgate ( output s, input p, q); 
	assign s = (~(p | q)); 
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
		$display("Exemplo 0007 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test NOR gate"); 
	$display("\n ( ~(a|b) ) = s\n"); 
	a=0; b=0; 
		#1 $display("%b & %b = %b", a, b, s); 
	a=0; b=1; 
		#1 $display("%b & %b = %b", a, b, s); 
	a=1; b=0; 
		#1 $display("%b & %b = %b", a, b, s); 
	a=1; b=1; 
		#1 $display("%b & %b = %b", a, b, s); 
	
	end 
	
	endmodule // testnorgate 
		 
//-------------

//Exemplo 0007 - Rodrigo Arruda de Assis - 427460
//	Test NOR gate
//	( ~(a|b) ) = s
//	0 & 0 = 1
//	0 & 1 = 0
//	1 & 0 = 0
//	1 & 1 = 0

//-------------