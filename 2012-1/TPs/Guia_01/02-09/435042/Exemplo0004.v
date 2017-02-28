// ------------------------- 
// Exemplo0004 - OR 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042 
// ------------------------- 
// Alterações feitas:
// Troquei a porta AND pela porta OR.
// Previsão:
// A saída é a disjunção das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0), (a=1 e b=1).
// Observações da saída:
// A saída é como se fosse uma tabela verdade da disjunção.
// Eu digo "como se fosse" porque o símbolo da disjunção é | e não & como indicado no guia 01.
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