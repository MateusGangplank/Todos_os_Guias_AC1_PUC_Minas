// Nome: Josué Santos Silva
// Matricula: 451585

module exercicios;

  reg [8:0] a;
  reg [7:0] b;
  reg [6:0] c;
  reg [5:0] d;
  reg [8:0] e;

  initial begin
    a = ~(6'b101111) + (1'b1);
    b = ~(6'b111001) + (1'b1);
    c = ~(25) + (1'b1);
    d = ~(4'hd) + (1'b1);
    e = ~(5'o24)+ (1'b1);

    $display("a = %d = %b", a, a);
    $display("b = %d = %b", b, b);
    $display("c = %d = %b", c, c);
    $display("d = %d = %b", d, d);
    $display("e = %d = %b", e, e);
  end

endmodule
