// -------------------------
// Ex0003
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module test_base_01;
      reg [4:0] a;
      reg [3:0] b;
	   reg [2:0] c;
		reg [4:0] d;
		reg [3:0] e;
initial begin
      a = ~(6'b101010) + (1'b1);
      b = ~(5'o25)+ (1'b1);
		c = ~(27) + (1'b1);
		d = ~(9'h2c) + (1'b1);
		e = ~(25-35)+ (1'b1);
      $display("a = %d = %3b", a, a);
      $display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
end
endmodule 	