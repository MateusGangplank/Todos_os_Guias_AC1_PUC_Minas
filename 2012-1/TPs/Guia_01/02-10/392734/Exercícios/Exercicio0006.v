// ------------------------- 
// Exercício0006 - XOR 
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// -------------------------

// ------------------------- 
// -- xor gate 
// ------------------------- 
 module xorgate ( output s, input p, q); 
	assign s = ~p * q + p * ~q; 
 endmodule // xorgate
 
// --------------------- 
// -- test xor gate
// --------------------- 
 module testxorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
			// atribuicao simultanea 
			// dos valores iniciais 
		a = 0; b = 0; 
 end
  
// ------------------------- parte principal 
	initial begin 
		$display("Exercício0006 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test XOR gate"); 
		$display("\n\t\t  time\t ~p * q + p * ~q = s\n"); 
		a = 0; b = 0; 
		$monitor("%d\t ~%b * %b + %b * ~%b = %b", $time, a, b, a, b, s);
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	 
	end 
	
 endmodule // testxorgate 