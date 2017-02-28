// -------------------------
// Exemplo0032 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module lu (output s, input a, input b, input chave);
   wire s0, s1, s2, s3, s4, s5;

   and AND1(s0, a, b);
   or OR1 (s1, a, b);
   not NOT1 (s2, chave);
   buf BUF2 (s3, chave);
   and AND2 (s4, s0, s2);
   and AND3 (s5, s1, s3);
   or OR2 (s, s4, s5);

endmodule

module lu4 (output [3:0] s, input [3:0] a, input [3:0] b, input chave);

   lu LU1 (s[0], a[0], b[0], chave);
   lu LU2 (s[1], a[1], b[1], chave);
   lu LU3 (s[2], a[2], b[2], chave);
   lu LU4 (s[3], a[3], b[3], chave);

endmodule

module test_LU;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   reg chave;
   wire [3:0] z;
   lu4 LU (z, x, y, chave);

// ------------------------- parte principal
initial begin
   $display("Exemplo0032 - Breno Macena - 462017");
   $display("Test LU's module");
   x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
   chave = 0;
   $display("chave = ",chave);
   #1 $display("%3b   %3b = %3b",x,y,z);
#1 chave = 1;
   $display("chave = ",chave);
   #1 $display("%3b   %3b = %3b",x,y,z);
end
endmodule // test_LU