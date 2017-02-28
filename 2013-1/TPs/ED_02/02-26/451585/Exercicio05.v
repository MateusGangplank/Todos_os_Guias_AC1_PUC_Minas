// Nome: Josué Santos Silva
// Matricula: 451585

module exercicios;

  reg [5:0] a;
  reg [2:0] b;
  reg [4:0] c;
  reg [0:0] d;
  reg [3:0] e;

  initial begin
    a = (8'b101011) + (~(8'b1001) + (1'b1));
    b = (8'b10011) + (~(8'o15) + (1'b1));
    c = (8'o35) + (~(8'hc) + (1'b1));
    d = (8'hba) + (~(8'b10111001) + (1'b1));
    e = (8'd37) + (~(8'h1B) + (1'b1));

    $display("a = %d = %b", a, a);
    $display("b = %d = %b", b, b);
    $display("c = %d = %b", c, c);
    $display("d = %d = %b", d, d);
    $display("e = %d = %b", e, e);
  end

endmodule
