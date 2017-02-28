// -------------------------
// Exercicio04
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [5:0] a;
		reg [5:0] b;
		reg [5:0] c;
		reg [5:0] d;
		reg [5:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio04 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = ~6'b101010;
		b = ~5'b11011;
		c = ~5'd23;
		d = ~4'hE;
		e = ~6'o26;

      $display("a = %d = %6b", a, a);
      $display("b = %d = %6b", b, b);
      $display("c = %d = %6b", c, c);
      $display("d = %d = %6b", d, d);
      $display("e = %d = %6b", e, e);

	end

endmodule // test