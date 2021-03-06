// ------------------------- 
// Exemplo0031
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
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

xor x4 (s[4], cc5, carryIn);

endmodule
module test_fullAdder; 
// ------------------------- definir dados 
reg [3:0] y; 
reg [3:0] x;
reg c;
wire [4:0] s; 
fullAdderSys s1 (s, x, y, c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test ALU's full adder"); 
$display("0-sum, 1-sub"); 
x = 4'b1101; y = 4'b0001; c = 1'b1;
#1 $display("%4b %1b (op) %4b = %5b", x, c, y, s);  
end 
endmodule 