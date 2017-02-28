// -------------------------
// Exemplo0015 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module test_base_05;
// ------------------------- definir dados
		//não e necessario
		
// ------------------------- parte principal
 initial begin
		$display("Exemplo 0015 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test number system");
		
		$display("\nComplements");
		$display("0 = %d = %3b = %3b", ~1, (1-1), ~1);
		$display("1 = %d = %3b = %3b", ~0, (2-1), ~0);
		$display("2 = %d = %3b = %3b", (1+1), (3-1), ~0+~0);
		
 end 

endmodule // test_base