// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// full adder
// -------------------------
module Adder (output s, input a, input b, input carryIn);
   wire s0;

   xor XOR1 (s0, a, b);
   xor XOR2 (s, s0, carryIn);

endmodule // fullAdder

module fullAdder (output carryOut, input a, input b, input carryIn);
   wire s1, s2, s3;

   xor XOR3 (s1, a, b);
   and AND1 (s2, s1, carryIn);
   and AND2 (s3, a, b);
   or OR1 (carryOut, s2, s3);

endmodule

module fullAdder1 (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
   wire s1, s2;

   Adder ADD1 (s[0], a[0], b[0], carryIn);
   fullAdder FULL1 (s1, a[0], b[0], carryIn);

   Adder ADD2 (s[1], a[1], b[1], s1);
   fullAdder FULL2 (s2, a[1], b[1], carryIn);

   Adder ADD3 (s[2], a[2], b[2], s2);
   fullAdder FULL3 (carryOut, a[2], b[2], carryIn);

endmodule

module test_fullAdder;

   reg [2:0] x;
   reg [2:0] y;
   reg carryIn;
   wire carryOut;
   wire [2:0] soma;

   fullAdder1 FULL (soma, carryOut, x, y, carryIn);

initial begin
   $display("Exemplo0021 - Breno Macena - 462017");
   $display("Test ALU’s full adder");

#1 x = 3'b000; y = 3'b000; carryIn = 3'b000;
#1 $monitor("%b + %b + %b = %b %b",x,y,carryIn,carryOut,soma);

#1 x = 3'b000; y = 3'b000; carryIn = 3'b001;
#1 x = 3'b000; y = 3'b001; carryIn = 3'b000;
#1 x = 3'b001; y = 3'b000; carryIn = 3'b000;
#1 x = 3'b000; y = 3'b001; carryIn = 3'b001;
#1 x = 3'b001; y = 3'b001; carryIn = 3'b001;

end
endmodule // test_fullAdder