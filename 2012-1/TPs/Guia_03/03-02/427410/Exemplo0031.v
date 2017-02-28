// -------------------------
//  Exemplo0031 - F4
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
// -------------------------
//    f4_gate
// -------------------------
module f4 (output [3:0] s, input  [3:0] a, input  [3:0] b);
// descrever por portas
endmodule // f4

module test_f4;
// ------------------------- definir dados
reg  [3:0] x;
reg  [3:0] y;
wire [3:0] z;
f4 modulo (z, x, y);

// ------------------------- parte principal
   initial begin
      $display("\nExemplo0031 - Gustavo Barbosa - 427410");
      $display("\nTest LU's module");
      x = 4'b0011;      y = 4'b0101;
   // projetar testes do modulo
   #1 $display("%3b %3b %3b",x,y,z);
   end
endmodule // test_f4