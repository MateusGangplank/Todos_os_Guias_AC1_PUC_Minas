// ------------------------- 
// Exercício0004 - NAND 
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// -------------------------

// ------------------------- 
// -- nand gate usando de MORGAN
// ------------------------- 
 module nandgate (output s, input p, input q); 
	assign s = (~p)|(~q); 
 endmodule // nandgate 
 
// --------------------- 
// -- test nand gate
// --------------------- 
 module testnandgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
		// atribuicao simultanea 
		// dos valores iniciais 
		a = 0; b = 0; 
	end
	
// ------------------------- parte principal

	initial begin 
		$display("Exercício0004 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test NAND gate"); 
		$display("(~p)|(~q) = s\n"); 
		a = 0; b = 0; 
	#1 $display("(~%b)|(~%b) = %b", a, b, s); 
		a = 0; b = 1; 
	#2 $display("(~%b)|(~%b) = %b", a, b, s); 
		a = 1; b = 0; 
	#3 $display("(~%b)|(~%b) = %b", a, b, s); 
		a = 1; b = 1; 
	#4 $display("(~%b)|(~%b) = %b", a, b, s); 
	end
	
	endmodule // testnandgate 