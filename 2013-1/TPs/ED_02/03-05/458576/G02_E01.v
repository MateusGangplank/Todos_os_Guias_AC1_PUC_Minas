// -------------------------
// Ex0001
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module test_base_01;
      reg [4:0] a;
      reg [4:0] b;
	   reg [3:0] c;
		reg [3:0] d;
		reg [4:0] e;
initial begin
      a =   3+14;
      b = 3*8;
		c = 33/5;
		d = 25-11;
		e = 2*8+7-1;
      $display("a = %d = %3b", a, a);
      $display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);

end
endmodule 