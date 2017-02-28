// -------------------------
// Exemplo0031 - FULL ADDER/DIFF
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// -------------------------
module fullAdder (output s, output carryOut, input a, input b, input carryIn);
   wire s0;

   xor XOR1 (s0, a, b);
   xor XOR2 (s, s0, carryIn);

   xor XOR3 (s1, a, b);
   and AND1 (s2, s1, carryIn);
   and AND2 (s3, a, b);
   or OR1 (carryOut, s2, s3);

endmodule

module fullAdder1 (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
   wire s0, s1, s2, s3, s4, s5;

   xor XOR1 (s0, carryIn, b[0]);
   xor XOR2 (s1, carryIn, b[1]);
   xor XOR3 (s2, carryIn, b[2]);

   fullAdder FULL1 (s[0], s3, s0, a[0], carryIn);
   fullAdder FULL2 (s[1], s4, s1, a[1], s3);
   fullAdder FULL3 (s[2], s5, s2, a[2], s4);

   xor XOR4 (carryOut, s5, carryIn);

endmodule

module test_fullAdder;

   reg [2:0] x;
   reg [2:0] y;
   reg carryIn;
   wire carryOut;
   wire [2:0] soma;

   fullAdder1 FULL (soma, carryOut, x, y, carryIn);

initial begin
   $display("Exemplo0031 - Breno Macena - 462017");
   $display("Test ALU’s full adder/diff");

#1 x = 3'b001; y = 3'b001; carryIn = 0;
#1 $display("carryIn = ",carryIn);
#1 $display("%b + %b = %b %b",x,y,carryOut,soma);
#1 x = 3'b010; y = 3'b100; carryIn = 0;
#1 $display("%b + %b = %b %b",x,y,carryOut,soma);
#1 x = 3'b111; y = 3'b011; carryIn = 0;
#1 $display("%b + %b = %b %b",x,y,carryOut,soma);
#1
#1 x = 3'b001; y = 3'b001; carryIn = 1;
#1 $display("carryIn = ",carryIn);
#1 $display("%b + %b = %b %b",x,y,carryOut,soma);
#1 x = 3'b010; y = 3'b100; carryIn = 1;
#1 $display("%b - %b = %b %b",x,y,carryOut,soma);
#1 x = 3'b111; y = 3'b011; carryIn = 1;
#1 $display("%b - %b = %b %b",x,y,carryOut,soma);

end
endmodule