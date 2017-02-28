// -------------------------
// Exercicio03
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [9:0] a;
		reg [9:0] b;
		reg [9:0] c;
		reg [9:0] d;
		reg [9:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio03 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = ~6'b101010 + 1;
		b = ~5'o25 + 1;
		c = ~5'd27 + 1;
		d = ~6'h2C + 1;
		e = ~25 - 35 + 1;

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test