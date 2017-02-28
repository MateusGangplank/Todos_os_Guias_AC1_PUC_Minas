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
		
		a = ~(6'b101010 - 4'b1001)+ 1;
		b = ~(5'b11011 - 6'o15)+ 1;
		c = ~(6'o34 - 4'hC)+ 1;
		d = ~(8'hDA - 8'b10111001)+ 1;
		e = ~(5'd27 - 8'h1B)+ 1;

      $display("a = %d = %b", a, a);
      $display("b = %d = %b", b, b);
      $display("c = %d = %b", c, c);
      $display("d = %d = %b", d, d);
      $display("e = %d = %b", e, e);

	end

endmodule // test