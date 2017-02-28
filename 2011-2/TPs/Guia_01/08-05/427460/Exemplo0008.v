
// ------------------------- 
// Exemplo0008 - xnor
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460
// ------------------------- 

// ------------------------- 
// -- xnorgate 
// ------------------------- 
	module xnorgate ( output s, input p, input q); 
	assign s = (~(p^q)); 
	endmodule // xnorgate 

// --------------------- 
// -- test xxnorgate 
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
		$display("Exemplo 0008 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test XNOR gate"); 
	$display("\n (~(a^b) )= s\n"); 
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


//------------		 

//	Exemplo 0008 - Rodrigo Arruda de Assis - 427460

// Test XNOR gate
// (~(a^b) )= s
// 0 & 0 = 1
// 0 & 1 = 0
// 1 & 0 = 0
// 1 & 1 = 1

//------------