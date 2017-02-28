// -------------------------
// Exercicio0012 - BASE
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  test number system
// -------------------------

module ex_base_02;
// ------------------------- definir dados
		reg [5:0] a = 6'b100010;
		reg [6:0] b = 5'b11010;
		reg [9:0] c = 5'b01;
		reg [6:0] d = 5'b01;
		reg [9:0] e = 5'b01;
		
// ------------------------- parte principal
 initial begin
		$display("Exercício 0012 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Ex number system");

		a =  6'b100010 + 5'b11010;
		b =  5'b11010 + 5'o23;
		c =  10'o1234 + 5'o23;
		d =  9'h1a9 - 9'b101101001;
		e =  25 * 6'o41 + 7'h6b;
		
		$display("\nExercícios");
		$display("a = %3d = %b", a, a);
		$display("b = %3d = %b", b, b);
		$display("c = %3d = %b", c, c);
		$display("d = %3d = %b", d, d);
		$display("e = %3d = %b", e, e);
				
 end

endmodule // test_base