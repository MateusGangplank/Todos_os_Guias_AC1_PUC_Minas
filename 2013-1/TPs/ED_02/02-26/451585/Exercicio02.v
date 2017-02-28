// Nome: Josué Santos Silva
// Matricula: 451585

/*100110(2) + 11011(2)*/
//11101(2) + 25(8)
//1234(8) / 4C(16)
//1BA(16) – 101110011(2)
/*25 * 32(8) + 8A(16)*/

module exercicios;

  reg[5:0] a;
  reg[4:0] b;
  reg[6:0] c;
  reg[4:0] d;
  reg[5:0] e;
  reg[10:0] f;
  reg[3:0] g;
  reg[9:0] h;

  initial begin
    $display("Exercicio 02 - Josué Santos Silva - 451585");
    $display("Test number system");

    // a
    a = 6'b100110;
    b = 5'b11011;
    c = a + b;

    $display("\na)");
    $display("%d + %d = %b", a, b, c);

    // b
    b = 5'b11101;
    a = 'o25;
    e = b + a;

    $display("\nb)");
    $display("%b + %o = %b", b, a, e);

    // c
    f = 'o1234;
    c = 'h4C;
    g = f / c;

    $display("\nc)");
    $display("%o / %h = %b", f, c, g);

    // d
    c = (9'h1ba) - (9'b101110011);

    $display("\nd)");
    $display("%b", c);

    // e
    h = 25*(5'o32)+(8'h8a);

    $display("\ne)");
    $display("%b", h);

  end
endmodule
