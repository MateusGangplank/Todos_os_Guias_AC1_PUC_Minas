// -------------------------
// Exercicio02
// Nome: Felipe Tôrres 
// Matricula: 412738
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
		$display("Exercicio02 - Felipe Tôrres - 412738");
      $display("Test number system");
		
		a = 6'b101010 + 5'b11010;
		b = 5'b11010 + 6'o25;
		c = 12'o1234 / 8'h2B;
		d = 12'h1CA - 9'b101110001;
		e = 25 * 6'o31 + 8'h7A;

      $display("a = %d = %7b", a, a);
      $display("b = %d = %6b", b, b);
      $display("c = %d = %4b", c, c);
      $display("d = %d = %7b", d, d);
      $display("e = %d = %10b", e, e);

	end

endmodule // test_base