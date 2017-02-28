// -------------------------
// Exercicio05
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  test number system
// -------------------------

module test;
// ------------------------- definir dados
		reg [7:0] a,b,c,d,e;

// ------------------------- parte principal

	initial begin
		$display("Exercicio05 - Rayan Darwin - 412770");
      $display("Test number system");
		
		a = ~(4'b1011 - 4'b1101);
		b = ~(5'b11010 - 6'o15);
		c = ~(6'o34 - 4'hB);
		d = ~(8'hCA - 8'b10111001);
		e = ~(5'd25 - 8'h1A);

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test