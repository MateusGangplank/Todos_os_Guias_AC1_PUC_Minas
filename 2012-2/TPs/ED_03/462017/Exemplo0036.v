// -------------------------
// Exemplo0036 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module lu (output z, input a, input b, input chave);
   wire s0, s1;

   xor XOR1 (s0, a, b);
   xor XOR2 (s1, s0, chave);
   not NOT (z, s1);
endmodule

module lu4 (output [3:0] z, input [3:0] a, input [3:0] b, input chave);
    lu LU1 (z[0], a[0], b[0], chave);
    lu LU2 (z[1], a[1], b[1], chave);
    lu LU3 (z[2], a[2], b[2], chave);
    lu LU4 (z[3], a[3], b[3], chave);
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
   $display("Exemplo0036 - Breno Macena - 462017");
   $display("Test LU's module");

   x = 4'b0110; y = 4'b1010;

#1 chave = 0;

#1 $display("chave = ",chave);
   $display("%3b   %3b = %3b",x,y,z);

#1 chave = 1;

#1 $display("chave = ",chave);
   $display("%3b   %3b = %3b",x,y,z);

end
endmodule // test_LU