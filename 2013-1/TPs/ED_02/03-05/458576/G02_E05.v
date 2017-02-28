// -------------------------
// Ex0005
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module test_base_01;
      reg [7:0] a;
      reg [6:0] b;
	   reg [5:0] c;
		reg [4:0] d;
		reg [7:0] e;
initial begin
      a = (6'b101011) + ((~4'b1001) + 1'b1);
      b = (5'b10011) + ((~4'o15) + 1'b1);
		c = (5'o35) + ((~4'hc) + 1'b1);
		d = (8'hba) + ((~8'b10111001) + 1'b1);
		e = (37) + ((~5'h1b) + 1'b1);
      $display("a = %d = %3b", a, a);
      $display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
end
endmodule 	