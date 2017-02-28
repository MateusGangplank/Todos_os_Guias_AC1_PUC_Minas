// -------------------------
// Exercicio03
// Nome: Felipe Tôrres 
// Matricula: 412738
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
		$display("Exercicio03 - Felipe Tôrres - 412738");
      $display("Test number system");
		
		a = ~6'b100111;
		b = ~5'o23;
		c = ~5'd23;
		d = ~6'h2B;
		e = ~26 - 36;

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test_base