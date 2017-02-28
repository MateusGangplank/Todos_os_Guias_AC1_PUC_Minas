// -------------------------
// Exercicio0011 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_01;
// ------------------------- definir dados
		reg [4:0] a;
		reg [4:0] b;
		reg [3:0] c;
		reg [3:0] d;
		reg [3:0] e;
		
// ------------------------- parte principal
 initial begin
		$display("Exercício 0011 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Ex number system");

		a =  2+14;
		b =  3*7;
		c =  34/3;
		d =  19-11;
		e =  2*4 + 6 -1;
		
		$display("\nExercícios");
		$display("a = %d = %5b", a, a);
		$display("b = %d = %5b", b, b);
		$display("c = %d = %5b", c, c);
		$display("d = %d = %5b", d, d);
		$display("e = %d = %5b", e, e);
				
 end

endmodule // test_base