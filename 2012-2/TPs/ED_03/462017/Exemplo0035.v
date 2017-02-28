// -------------------------
// Exemplo0035 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module lu (output z, input a, input b, input c0, input c1, input c2);
   wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18;

   not NOTA (s0, a);
   and AND (s1, a, b);
   or OR (s2, a, b);
   nor NOR (s3, a, b);
   nand NAND (s4, a, b);
   xor XOR (s5, a, b);
   xnor XNOR (s6, a, b);
   not NOTB (s7, b);

   not NOT1 (s8, c0);
   not NOT2 (s9, c1);
   not NOT3 (s10, c2);

   and AND1 (s11, s0, s8, s9, s10);

   and AND2 (s12, s1, s8, s9, c2);
   and AND3 (s13, s2, s8, s10, c1);
   and AND4 (s14, s3, s9, s10, c0);

   and AND5 (s15, s4, s8, c1, c2);
   and AND6 (s16, s5, s9, c0, c2);
   and AND7 (s17, s6, s10, c0, c1);

   and AND8 (s18, s7, c0, c1, c2);

   or OR1 (z, s11, s12, s13, s14, s15, s16, s17, s18);

endmodule

module lu4 (output [3:0] s, input [3:0] a, input [3:0] b, input c0, input c1, input c2);

   lu LU1 (s[0], a[0], b[0], c0, c1, c2);
   lu LU2 (s[1], a[1], b[1], c0, c1, c2);
   lu LU3 (s[2], a[2], b[2], c0, c1, c2);
   lu LU4 (s[3], a[3], b[3], c0, c1, c2);


endmodule

module test_LU;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   reg c0;
   reg c1;
   reg c2;
   wire [3:0] z;
   lu4 LU (z, x, y, c0, c1, c2);

// ------------------------- parte principal
initial begin
   $display("Exemplo0035 - Breno Macena - 462017");
   $display("Test LU's module");
   x = 4'b0011; y = 4'b0101;

#1 c0 = 0;      c1 = 0;          c2 = 0;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 0;      c1 = 0;          c2 = 1;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 0;      c1 = 1;         c2 = 0;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 0;      c1 = 1;         c2 = 1;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;      c1 = 0;          c2 = 0;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;      c1 = 0;          c2 = 1;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;      c1 = 1;         c2 = 0;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);

#1 c0 = 1;      c1 = 1;         c2 = 1;

#1 $display("chave = ",c0,c1,c2);
   $display("%3b   %3b = %3b",x,y,z);
end
endmodule // test_LU