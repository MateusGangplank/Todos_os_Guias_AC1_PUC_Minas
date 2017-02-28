// -------------------------
// Exemplo0021 – FULL DIFF
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// full diff
// -------------------------
module Diff (output s, input a, input b, input carryIn);
   wire s0;

   xor XOR1 (s0, a, b);
   xor XOR2 (s, s0, carryIn);

endmodule

module fulldiff (output carryOut, input a, input b, input carryIn);
   wire s1, s2, s3, s4;

   xor XOR3 (s1, b, carryIn);
   not NOT1 (s2, a);
   and AND1 (s3, s1, s2);
   and AND2 (s4, b, carryIn);
   or OR1 (carryOut, s4, s3);

endmodule

module fulldiff1 (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
   wire s1, s2;

   Diff DIFF1 (s[0], a[0], b[0], carryIn);
   fulldiff FULL1 (s1, a[0], b[0], carryIn);

   Diff DIFF2 (s[1], a[1], b[1], s1);
   fulldiff FULL2 (s2, a[1], b[1], carryIn);

   Diff DIFF3 (s[2], a[2], b[2], s2);
   fulldiff FULL3 (carryOut, a[2], b[2], carryIn);

endmodule

module test_fulldiff;

   reg [2:0] x;
   reg [2:0] y;
   reg carryIn;
   wire carryOut;
   wire [2:0] diff;

   fulldiff1 FULL (diff, carryOut, x, y, carryIn);

initial begin
   $display("Exemplo0022 - Breno Macena - 462017");
   $display("Test ALU’s full diff");

#1 x = 3'b000; y = 3'b000; carryIn = 3'b000;
#1 $monitor("%b - %b - %b = %b %b",x,y,carryIn,carryOut,diff);

#1 x = 3'b000; y = 3'b000; carryIn = 3'b001;
#1 x = 3'b000; y = 3'b001; carryIn = 3'b000;
#1 x = 3'b001; y = 3'b000; carryIn = 3'b000;
#1 x = 3'b000; y = 3'b001; carryIn = 3'b001;
#1 x = 3'b001; y = 3'b001; carryIn = 3'b001;

end
endmodule