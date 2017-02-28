// ------------------------- 
// Exemplo0004 - OR 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042 
// ------------------------- 
// Altera��es feitas:
// Troquei a porta AND pela porta OR.
// Previs�o:
// A sa�da � a disjun��o das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0), (a=1 e b=1).
// Observa��es da sa�da:
// A sa�da � como se fosse uma tabela verdade da disjun��o.
// Eu digo "como se fosse" porque o s�mbolo da disjun��o � | e n�o & como indicado no guia 01.
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
	input p, q); 
	assign s = p | q; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
	// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s;   // definir conexao (fio) 
	// ------------------------- instancia 
	orgate OR1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0; b=0; 
	end 
	// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0004 - Daniel Telles McGinnis - 435042"); 
		$display("Test OR gate"); 
		$display("\na & b = s\n"); 
		a=0; b=0; 
		#1 $display("%b & %b = %b", a, b, s); 
		a=0; b=1; 
		#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=0; 
		#1 $display("%b & %b = %b", a, b, s); 
		a=1; b=1; 
		#1 $display("%b & %b = %b", a, b, s); 
	end 
endmodule // testorgate 