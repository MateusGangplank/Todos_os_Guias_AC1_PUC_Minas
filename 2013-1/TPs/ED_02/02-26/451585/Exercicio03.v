// Nome: Josué Santos Silva
// Matricula: 451585

module exercicios;
  
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
 
    $display("a = %d = %b", a, a);
    $display("b = %d = %b", b, b);
    $display("c = %d = %b", c, c);
    $display("d = %d = %b", d, d);
    $display("e = %d = %b", e, e);
  end

endmodule
