// -------------------------
// Exemplo0034 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module lu (output z, input a, input b, input c0, input c1);
   wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;

   or OR1 (s0, a, b);
   nor NOR1 (s1, a, b);
   xor XOR1 (s2, a, b);
   xnor XNOR1 (s3, a, b);
   not NOT1 (s4, c0);
   not NOT2 (s5, c1);
   and AND1 (s6, s0, s4, s5);
   not NOT3 (s7, c0);
   buf BUF1 (s8, c1);
   and AND2 (s9, s1, s7, s8);
   buf BUF2 (s10, c0);
   not NOT4 (s11, c1);
   and AND3 (s12, s2, s10, s11);
   buf BUF3 (s13, c0);
   buf BUF4 (s14, c1);
   and AND4 (s15, s3, s13, s14);
   or OR2 (z, s6, s9, s12, s15);

endmodule

module lu4 (output [3:0] s, input [3:0] a, input [3:0] b, input c0, input c1);

   lu LU1 (s[0], a[0], b[0], c0, c1);
   lu LU2 (s[1], a[1], b[1], c0, c1);
   lu LU3 (s[2], a[2], b[2], c0, c1);
   lu LU4 (s[3], a[3], b[3], c0, c1);

endmodule

module test_LU;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   reg c0;
   reg c1;
   wire [3:0] z;
   lu4 LU (z, x, y, c0, c1);

// ------------------------- parte principal
initial begin
   $display("Exemplo0034 - Breno Macena - 462017");
   $display("Test LU's module");
   x = 4'b0011; y = 4'b0101;

#1 c0 = 0;      c1 = 0;

#1 $display("chave = ",c0, c1);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 0;       c1 = 1;

#1 $display("chave = ",c0, c1);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;       c1 = 0;

#1 $display("chave = ",c0, c1);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;       c1 = 1;

#1 $display("chave = ",c0, c1);
   $display("%3b   %3b = %3b",x,y,z);
end
endmodule // test_LU