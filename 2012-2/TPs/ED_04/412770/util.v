// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
// -------------------------
//  full adder
// -------------------------

module fullAdder (output s1, output s0, input a, input b,  input ci);
       wire x,y,z;
       xor XOR1(x,a,b);
       and AND1(y,a,b);
       xor XOR2(s1,x,ci);
       and AND2(z,x,ci);
       or OR2(s0,z,y);
endmodule // fullAdder

module halfAdder (output s1, output s0, input a, input b);
       xor XOR1(s1, a, b);
       and AND1(s0, a, b);
endmodule

module halfSub (output s1, output s0, input a, input b);
       xor XOR1(s1, a, b);
       and AND1(s0, ~ a, b);
endmodule

module fullSub (output s1, output s0, input a, input b, input ci);
       wire x,y,z,k1,k2;
       xor XOR1(x,a,b);
       not NOT1(k1,a);
       and AND1(y,k1,b);
       xor XOR2(s1,x,ci);
       not NOT2(k2,x);
       and AND2(z,k2,ci);
       or  OR1 (s0,y,z);
endmodule
/*
module test__fullAdder;
// ------------------------- definir dados
reg x;
reg y;
reg carry;
wire [1:0] s;

fullSub FA1 (s[1], s[0], x, y, carry);
// ------------------------- parte principal
initial begin
$display("Exemplo0020 - Rayan Darwin - 412770");
$display("Test ALU’s full adder");

x = 0; y = 0; carry = 0;
$display("A | B | C | Resultado");
$monitor("%2b %2b %2b = %3b", x, y, carry, s);

#1 x = 0;     y = 0;    carry = 1;
#1 x = 0;     y = 1;    carry = 0;
#1 x = 0;     y = 1;    carry = 1;
#1 x = 1;     y = 0;    carry = 0;
#1 x = 1;     y = 0;    carry = 1;
#1 x = 1;     y = 1;    carry = 0;
#1 x = 1;     y = 1;    carry = 1;

// projetar testes do somador complete

end
endmodule // test_fullAdder
*/