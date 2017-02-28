// -------------------------
// Exercicio02
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [6:0] a;
		reg [5:0] b;
		reg [3:0] c;
		reg [6:0] d;
		reg [9:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio02 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = 6'b101010 + 5'b11011;
		b = 5'b11011 + 6'o25;
		c = 12'o1234 / 8'h3C;
		d = 12'h1BA - 9'b101110001;
		e = 25 * 6'o32 + 8'h7A;

      $display("a = %d = %7b", a, a);
      $display("b = %d = %6b", b, b);
      $display("c = %d = %4b", c, c);
      $display("d = %d = %7b", d, d);
      $display("e = %d = %10b", e, e);

	end

endmodule // test