// -------------------------
// Exemplo0033 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module lu (output z1, output z2, input a, input b, input chave);
   wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9;

   and AND1(s0, a, b);
   or OR1 (s1, a, b);
   nand NANd1 (s2, a, b);
   nor NOR1 (s3, a, b);
   not NOT1 (s4, chave);
   buf BUF1 (s5, chave);
   and AND2 (s6, s0, s4);
   and AND3 (s7, s1, s4);
   and AND4 (s8, s2, s5);
   and AND4 (s9, s3, s5);
   or OR2 (z1, s6, s8);
   or OR3 (z2, s7, s9);

endmodule

module lu4 (output [3:0] s0, output [3:0] s1, input [3:0] a, input [3:0] b, input chave);

   lu LU1 (s0[0], s1[0], a[0], b[0], chave);
   lu LU2 (s0[1], s1[1], a[1], b[1], chave);
   lu LU3 (s0[2], s1[2], a[2], b[2], chave);
   lu LU4 (s0[3], s1[3], a[3], b[3], chave);

endmodule

module test_LU;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   reg chave;
   wire [3:0] z0;
   wire [3:0] z1;
   lu4 LU (z0, z1, x, y, chave);

// ------------------------- parte principal
initial begin
   $display("Exemplo0033 - Breno Macena - 462017");
   $display("Test LU's module");
   x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
   chave = 0;
   $display("chave = ",chave);
   #1 $display("%3b   %3b = %3b ou %3b",x,y,z0,z1);
#1 chave = 1;
   $display("chave = ",chave);
   #1 $display("%3b   %3b = %3b ou %3b",x,y,z0,z1);
end
endmodule // test_LU