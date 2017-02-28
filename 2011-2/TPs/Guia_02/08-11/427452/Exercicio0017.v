// -------------------------
// Exercicio0017 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_07;
// ------------------------- definir dados
		reg [0:7] a = 8'b00001011;  //entrada de 1 byte ou 8 bits
		
// ------------------------- parte principal
 initial begin
		$display("Exercício 0017 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Ex number system");

		a = ~a + 1; // complemento de 1 mais 1;
		
		$display("\nComplemento de 2");
		$display("a = %3d = %b", a, a);
		
 end

endmodule // test_base