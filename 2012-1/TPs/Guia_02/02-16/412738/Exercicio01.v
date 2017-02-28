// -------------------------
// Exercicio01
// Nome: Felipe Tôrres 
// Matricula: 412738
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
		$display("Exercicio01 - Felipe Tôrres - 412738");
      $display("Test number system");
		
		a = 2 + 15;
		b = 3 * 8;
		c = 32 /3;
		d = 21 - 11;
		e = 2 * 5 + 6 - 1;

      $display("a = %d = %5b", a, a);
      $display("b = %d = %5b", b, b);
      $display("c = %d = %4b", c, c);
      $display("d = %d = %4b", d, d);
      $display("e = %d = %4b", e, e);

	end

endmodule // test_base