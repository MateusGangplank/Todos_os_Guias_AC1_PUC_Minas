// -------------------------
// Exercicio05
// Nome: Felipe Tôrres 
// Matricula: 412738
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [7:0] a,b,c,d,e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio05 - Felipe Tôrres - 412738");
      $display("Test number system");
		
		a = ~(4'b1011 - 4'b1101);
		b = ~(5'b11010 - 4'o15);
		c = ~(5'o34 - 8'hB);
		d = ~(8'hCA - 8'b10111001);
		e = ~(5'd25 - 5'h1A);

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test_base