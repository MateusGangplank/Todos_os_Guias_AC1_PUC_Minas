// ------------------------- 
// Exemplo0022 - FULL SUBTRACTOR 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// full subtractor
// ------------------------- 
module fullSub (output s0,
output s1, 
input a, 
input b, 
input carryIn); 

wire p1,p2,p3;

and and1 (p1,~a, b);
xor xor1 (p2, a, b);
and and2 (p3, carryIn,~p2);
xor xor2 (s0, p2, carryIn);
or or1 (s1, p3, p1); 
 
endmodule // 
module fullSubSys (output [4:0] s, 
input [3:0] a, 
input [3:0] b, 
input carryIn);

wire s0v1,s0v2,s0v3,s1v1,s1v2,s1v3;

fullSub ad1 (s[0], s1v1, a[0], b[0], carryIn);
fullSub ad2 (s[1], s1v2, a[1], b[1], s1v1);
fullSub ad3 (s[2], s1v3, a[2], b[3], s1v2);
fullSub ad4 (s[3], s[4], a[3], b[3], s1v3);


endmodule
module test_fullSub; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg c; 
wire [4:0] s; 
fullSubSys s1 (s, x, y, c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test ALU's full subtractor"); 
x = 3'b110; y = 3'b111; c = 1'b0;
#1 $display("%3b + %3b = %4b", x, y, s);  
end 
endmodule // test_fullSub 