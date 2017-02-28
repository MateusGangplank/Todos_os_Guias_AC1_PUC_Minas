// -------------------------
// Exercicio04
// Nome: Felipe Tôrres 
// Matricula: 412738
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [8:0] a;
		reg [7:0] b;
		reg [6:0] c;
		reg [5:0] d;
		reg [8:0] e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio04 - Felipe Tôrres - 412738");
      $display("Test number system");
		
		a = ~6'b101010;
		b = ~5'b11011;
		c = ~5'd23;
		d = ~6'hE;
		e = ~5'o26;

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test_base