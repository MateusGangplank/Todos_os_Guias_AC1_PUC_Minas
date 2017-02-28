// Nome: Josué Santos Silva
// Matricula: 451585

module exercicios;
  reg [2:0] a;
  reg [3:0] b;
  reg [4:0] c;
  reg [5:0] d;
  reg [2:0] e;
  reg [3:0] f;
  reg [4:0] g;

  initial begin
    $display("Exercicio 01 - Josué Santos Silva - 451585");
    $display("Test number system");

    // a
    a = 5;
    b = 14;
    c = 5 + 14;

    $display("\na)");
    $display("%d + %d = [%d] %b", a, b, c, c);

    // b
    a = 3;
    b = 8;
    c = a * b;

    $display("\nb)");
    $display("%d * %d = [%d] %b", a, b, c, c);

    // c
    a = 5;
    d = 33;
    e = d / a;

    $display("\nc)");
    $display("%d / %d = [%d] %b", a, d, e, e);

    // d
    d = 25;
    b = 11;
    f = d - b;

    $display("\nd)");
    $display("%d - %d = [%d] %b", d, b, f, f);

    // e
    c = 2 * 8;
    a = 7 - 1;
    g = c + a;

    $display("\ne)");
    $display("%d + %d = [%d] %b", c, a, g, g);
  end
endmodule
