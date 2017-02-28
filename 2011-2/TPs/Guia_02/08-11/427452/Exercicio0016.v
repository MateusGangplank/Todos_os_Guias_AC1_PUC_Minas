// -------------------------
// Exercicio0016 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_06;
// ------------------------- definir dados
		reg [0:7] a = 00000000;  //entrada de 1 byte ou 8 bits
		
// ------------------------- parte principal
 initial begin
		$display("Exercício 0016 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Ex number system");

		a = ~a; // negação de ao ou o inverso do mesmo;
		
		$display("\nComplemento de 1");
		$display("a = %3d = %b", a, a);
		
 end

endmodule // test_base