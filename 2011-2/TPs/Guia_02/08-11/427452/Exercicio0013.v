// -------------------------
// Exercicio0013 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_03;
// ------------------------- definir dados
		reg [5:0] a;
		reg [5:0] b;
		reg [3:0] c;
		reg [4:0] d;
		reg [3:0] e;
		
// ------------------------- parte principal
 initial begin
		$display("Exercício 0013 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Ex number system");

		a =  ~6'b100111 + 1;
		b =  ~6'o54 + 1;
		c =  ~13 + 1;
		d =  ~5'h1b + 1;
		e =  25 - 36;
		
		$display("\nExercícios");
		$display("a = %3d = (1)%b", a, a);
		$display("b = %3d = (1)%b", b, b);
		$display("c = %3d = (1)%b", c, c);
		$display("d = %3d = (1)%b", d, d);
		$display("e = %3d = (1)%b", e, e);
				
 end

endmodule // test_base