// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// -------------------------
// -------------------------
// full adder
// -------------------------
module fullAdder (output s0, output s1, input a, input b, input carryIn);
wire s2, s3, s4, s5;
xor XOR1(s2, a, b);
xor XOR2(s0, s2, carryIn);
and AND1(s3, b, carryIn);
and AND2(s4, a, carryIn);
and AND3(s5, a, b);
or OR1(s1, s3, s4, s5);

endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
reg[0:2] x;
reg[0:2] y;
reg carry;
wire[0:2] soma1;
wire[0:2] soma2;

fullAdder modulo1(soma1[0], soma2[0], x[0], y[0], carry);
fullAdder modulo2(soma1[1], soma2[1], x[1], y[1], carry);
fullAdder modulo3(soma1[2], soma2[2], x[2], y[2], carry);
// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Guilherme Moreira Nunes - 408947");
$display("Test ALU’s full adder");
$display(" x     y    ci   s0   s1 ");
#1 x = 7; y = 7; carry = 0;
$monitor("%b + %b + %b  = %b  %b", x, y, carry, soma2, soma1);

#1 x = 5; y = 6; carry = 1;
#1 x = 2; y = 4; carry = 0;
#1 x = 3; y = 1; carry = 1;
// projetar testes do somador complete
end
endmodule // test_fullAdder