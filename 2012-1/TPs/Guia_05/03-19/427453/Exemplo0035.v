// ------------------------- 
// Exemplo0034
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// full adder 
// -------------------------
module compare1 (output [1:0] res,
input  [3:0] g,
input [3:0] h);
wire c1,c2,c3,c4,c5,c6;
wire d1,d2,d3,d4,d5,d6;

xor aa1 (c1, g[0], h[0]);
xor aa2 (c2, g[1], h[1]);
xor aa3 (c3, g[2], h[2]);
xor aa4 (c4, g[3], h[3]);
xor aa5 (c5, c1, c2);
xor aa6 (c6, c3, c4);
xor aa7 (res[0], c5, c6);
// h > g
and ab1 (d1, ~g[0], h[0]);
and ab2 (d2, ~g[1], h[1]);
and ab3 (d3, ~g[2], h[2]);
and ab4 (d4, ~g[3], h[3]);
and ab5 (d5, d1, d2);
and ab6 (d6, d3, d4);
and ab7 (res[1], d5, d6);
endmodule 
module fullAdder (output s0,
output s1, 
input a, 
input b, 
input carryIn); 

wire p1,p2,p3;

and and1 (p1, a, b);
xor xor1 (p2, a, b);
and and2 (p3, carryIn, p2);
xor xor2 (s0, p2, carryIn);
or or1 (s1, p3, p1); 
 
endmodule // fullAdder 

module fullAdderSys (output [4:0] s,
output sinal, 
output [3:0] higher,
output [1:0] compa,
input [3:0] a, 
input [3:0] b, 
input carryIn);

wire s0v1,s0v2,s0v3,s1v1,s1v2,s1v3;
wire cc1,cc2,cc3,cc4,cc5;

compare1 com (compa, a, b);

xor x1 (cc1, b[0], carryIn);
xor x2 (cc2, b[1], carryIn);
xor x3 (cc3, b[2], carryIn);
xor x4 (cc4, b[3], carryIn);


fullAdder ad1 (s[0], s1v1, a[0], cc1, carryIn);
fullAdder ad2 (s[1], s1v2, a[1], cc2, s1v1);
fullAdder ad3 (s[2], s1v3, a[2], cc3, s1v2);
fullAdder ad4 (s[3], cc5, a[3], cc4, s1v3);

xor x4 (s[4], cc5, carryIn);

sinali si (sinal, s);

higher1 hi (higher, a, 4'b0001, 1'b1);

endmodule

module sinali (output w, input [4:0] f);
wire s1,s2,s3;
and a1 (s1, f[0], f[1]);
and a2 (s2, f[2], f[3]);
and a3 (s3, s1, s2);
nand a4 (w, s3, f[4]);
endmodule

module higher1 (output [3:0] s,
input [3:0] a, 
input [3:0] b, 
input carryIn);

wire s0v1,s0v2,s0v3,s1v1,s1v2,s1v3;
wire cc1,cc2,cc3,cc4,cc5;

xor x1 (cc1, b[0], carryIn);
xor x2 (cc2, b[1], carryIn);
xor x3 (cc3, b[2], carryIn);
xor x4 (cc4, b[3], carryIn);


fullAdder ad1 (s[0], s1v1, a[0], cc1, carryIn);
fullAdder ad2 (s[1], s1v2, a[1], cc2, s1v1);
fullAdder ad3 (s[2], s1v3, a[2], cc3, s1v2);
fullAdder ad4 (s[3], cc5, a[3], cc4, s1v3);

endmodule

module test_fullAdder; 
// ------------------------- definir dados 
reg [3:0] y; 
reg [3:0] x;
reg c;
wire [1:0] comp1;
wire si;
wire [3:0] hib;
wire [4:0] s; 
fullAdderSys s1 (s, si, hib, comp1, x, y, c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test ALU's full adder"); 
$display("0-sum, 1-sub"); 
$display("comparator: equal|b>a"); 
x = 4'b1101; y = 4'b1101; c = 1'b1;
#1 $display("%4b %1b (op) %4b (decres. de b = %3b) = %5b com flag (%1b)", x, c, y, hib, s, si);  
#1 $display("%4b comparado com %4b = %2b", x, y, comp1);  
end 
endmodule 