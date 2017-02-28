// -------------------------
// Ex0004
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
      a = ~(6'b101111) + (1'b1);
      b = ~(8'o321) + (1'b1);
		c = ~(25) + (1'b1);
		d = ~(4'hd) + (1'b1);
		e = ~(5'o24) + (1'b1);
      $display("a = %d = %3b", a, a);
      $display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
end
endmodule 	