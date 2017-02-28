// -------------------------
// Ex0002
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module test_base_01;
      reg [8:0] a;
      reg [5:0] b;
	   reg [3:0] c;
		reg [6:0] d;
		reg [9:0] e;
initial begin
      a = (6'b100110)+(5'b11011);
      b = (5'b11101)+(5'o25);
		c = (11'o1234)/(7'h4c);
		d = (9'h1ba)-(9'b101110011);
		e = 25*(5'o32)+(8'h8a);
      $display("a = %d = %3b", a, a);
      $display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);

end
endmodule 	