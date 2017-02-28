// ------------------------- 
// Exercício0005 - NOR 
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// -------------------------

// ------------------------- 
// -- nor gate usando de MORGAN
// ------------------------- 
 module norgate ( output s, input p, q); 
	assign s = (~p)&(~q); 
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
			// atribuicao simultanea 
			// dos valores iniciais 
		a = 0; b = 0; 
 end
  
// ------------------------- parte principal 
	initial begin 
		$display("Exercício0005 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test NOR gate"); 
		$display("\n\t\t  time\t ~(a & b) = s\n"); 
		a = 0; b = 0; 
		$monitor("%d\t ~(%b & %b) = %b", $time, a, b, s);
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	 
	end 
	
 endmodule // testnorgate 