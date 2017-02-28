// -------------------------
// Exercicio01
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test_01;
// ------------------------- definir dados
		reg [4:0] a;
		reg [4:0] b;
		reg [3:0] c;
		reg [3:0] d;
		reg [3:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio01 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = 3 + 14;
		b = 3 * 8;
		c = 33 /5;
		d = 25 - 11;
		e = 2 * 8 + 7 - 1;

      $display("a = %d = %5b", a, a);
      $display("b = %d = %5b", b, b);
      $display("c = %d = %4b", c, c);
      $display("d = %d = %4b", d, d);
      $display("e = %d = %4b", e, e);

	end

endmodule // test_01