// -------------------------
// Exemplo0021 – FULL SUB
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// -------------------------
// -------------------------
// full Sub
// -------------------------
module fullSub (output s0, output s1, input a, input b, input carryIn);
wire s2, s3, s4, s5, s6;
xor XOR1(s2, a, b);
not NOT1(s3, a);
and AND1(s4, b, s3);
xor XOR2(s0, s2, carryIn);
not NOT2(s5, s2);
and AND2(s6, s5, carryIn);
or OR1(s1, s4, s6);

endmodule // full Sub
module test_fullSub;
// ------------------------- definir dados
reg[0:2] x;
reg[0:2] y;
reg carry;
wire[0:2] sub1;
wire[0:2] sub2;

fullSub modulo1(sub1[0], sub2[0], x[0], y[0], carry);
fullSub modulo2(sub1[1], sub2[1], x[1], y[1], carry);
fullSub modulo3(sub1[2], sub2[2], x[2], y[2], carry);
// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Guilherme Moreira Nunes - 408947");
$display("Test ALU’s full Sub");
$display("x   y   ci  s0 s1");
#1 x = 0; y = 0; carry = 0;
$monitor("%b - %b - %b = %b  %b", x, y, carry, sub1, sub2);

#1 x = 0; y = 0; carry = 1;
#1 x = 0; y = 1; carry = 0;
#1 x = 0; y = 1; carry = 1;
#1 x = 1; y = 0; carry = 0;
#1 x = 1; y = 1; carry = 1;
// projetar testes
end
endmodule // test_fullSub