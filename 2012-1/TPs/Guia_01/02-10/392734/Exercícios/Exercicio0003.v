// ------------------------- 
// Exercício0003 - XNOR 
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// -------------------------

// ------------------------- 
// -- xnor gate 
// ------------------------- 
 module xnorgate ( output s, input p, q); 
	assign s = ( ~(p^q) )  ; 
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
			// atribuicao simultanea 
			// dos valores iniciais 
		a = 0; b = 0; 
 end
  
// ------------------------- parte principal 
	initial begin 
		$display("Exercício0003 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test XNOR gate"); 
		$display("\n\t\t  time\t ~(a ^ b) = s\n"); 
		a = 0; b = 0; 
		$monitor("%d\t ~(%b ^ %b) = %b", $time, a, b, s);
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	 
	end 
	
 endmodule // testxnorgate 