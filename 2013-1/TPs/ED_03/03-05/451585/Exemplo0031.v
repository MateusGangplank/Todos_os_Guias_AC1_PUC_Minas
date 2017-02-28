// -------------------------
// Exemplo0031 - F4
// Nome: Josué Santos Silva
// Matricula: 451585
// -------------------------

module F4 (output [7:0]s, input [3:0]a, input[3:0]b);

  or or0 (s[0],a[0],b[0]);
  or or1 (s[1],a[1],b[1]);
  or or2 (s[2],a[2],b[2]);
  or or3 (s[3],a[3],b[3]);

  and and0 (s[4],a[0],b[0]);
  and and1 (s[5],a[1],b[1]);
  and and2 (s[6],a[2],b[2]);
  and and3 (s[7],a[3],b[3]);

endmodule

// Testes
module TESTEF4;

  reg [3:0]x;
  reg [3:0]y;
  wire [7:0]z;

  initial begin
      x='b0000;
      y='b0000;
  end

  F4 portas (z,x,y);

  initial begin

      $display("Exercicio0031");
      $display("Teste LU's module");

      x='b1010;
      y='b1110;

      $monitor("x | y = %b     x & y = %b",z[3:0],z[7:4]);

  end
endmodule
