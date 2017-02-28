// -------------------------
// Exercício0011 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_01;
// ------------------------- definir dados
		reg [2:0] a;
		reg [3:0] b;
		reg [4:0] c;
		
// ------------------------- parte principal
 initial begin
		$display("Exemplo 0014 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test number system");

      a =  5+3;
      b =  5+3;
      c =  10-5+25+3+1;
		
		$display("\nOverflow");
		$display("a = %d = %3b", a, a);
		$display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);		// o resultado da expreção e 34, tendo que exibir 100010, porem como so e exibido ate a 5 casa fica 00010.
		
 end 

endmodule // test_base