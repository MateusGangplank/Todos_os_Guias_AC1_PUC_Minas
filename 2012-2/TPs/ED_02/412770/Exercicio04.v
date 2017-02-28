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
		reg [7:0] a;
		reg [6:0] b;
		reg [5:0] c;
		reg [4:0] d;
		reg [7:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio04 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = ~6'b101011 + 1;
		b = ~9'd321 + 1;
		c = ~5'd27 + 1;
		d = ~4'hC + 1;
		e = ~6'o21 + 1;

      $display("a = %d = %8b", a, a);
      $display("b = %d = %7b", b, b);
      $display("c = %d = %6b", c, c);
      $display("d = %d = %5b", d, d);
      $display("e = %d = %8b", e, e);

	end

endmodule // test