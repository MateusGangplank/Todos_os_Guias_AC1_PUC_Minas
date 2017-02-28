// -------------------------
// Exemplo0032
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// full adder
// -------------------------
module halfAdder (output s0, output s1, input a, input b);

   xor XOR (s0, a, b);
   and AND (s1, a, b);

endmodule

module fullAdder (output s, output carryOut, input a, input b, input carryIn);
   wire s0;

   xor XOR1 (s0, a, b);
   xor XOR2 (s, s0, carryIn);

   xor XOR3 (s1, a, b);
   and AND1 (s2, s1, carryIn);
   and AND2 (s3, a, b);
   or OR1 (carryOut, s2, s3);

endmodule // fullAdder

module fullAdder1 (output [2:0] s, output carryOut, output flag,
                   input inc, input [2:0] a, input [2:0] b, input carryIn);
   wire s0, s1, s2, s3, s4, s5, s60, s61, s70, s71, s80, s81;

   xor XOR1 (s0, carryIn, b[0]);
   xor XOR2 (s1, carryIn, b[1]);
   xor XOR3 (s2, carryIn, b[2]);

   halfAdder HALF1 (s60, s61, a[0], inc);
   halfAdder HALF2 (s70, s71, a[1], s61);
   halfAdder HALF3 (s80, s81, a[2], s71);

   fullAdder FULL1 (s[0], s3, s0, s60, carryIn);
   fullAdder FULL2 (s[1], s4, s1, s70, s3);
   fullAdder FULL3 (s[2], s5, s2, s80, s4);

   xor XOR4 (carryOut, s5, carryIn);
   nor NOR1 (flag, s[0], s[1], s[2]);

endmodule

module test_fullAdder;

   reg [2:0] x;
   reg [2:0] y;
   reg carryIn;
   reg inc = 1;
   wire carryOut;
   wire flag;
   wire [2:0] soma;

   fullAdder1 FULL (soma, carryOut, flag, inc, x, y, carryIn);

initial begin
   $display("Exemplo0032 - Breno Macena - 462017");
   $display("Test ALU’s full adder");
   $display("Incremento (inc) = ",inc);
#1 x = 3'b000; y = 3'b000; carryIn = 0;
#1 $display("carryIn = ",carryIn);
#1 $display("%b + %b = %b",x,y,soma);
#1 x = 3'b001; y = 3'b000; carryIn = 0;
#1 $display("%b + %b = %b",x,y,soma);
#1 x = 3'b010; y = 3'b000; carryIn = 0;
#1 $display("%b + %b = %b",x,y,soma);
#1 x = 3'b100; y = 3'b010; carryIn = 1;
#1 $display("%b - %b = %b",x,y,soma);
#1 x = 3'b100; y = 3'b001; carryIn = 1;
#1 $display("%b - %b = %b",x,y,soma);
#1 x = 3'b111; y = 3'b001; carryIn = 1;
#1 $display("%b - %b = %b",x,y,soma);

end
endmodule // test_fullAdder