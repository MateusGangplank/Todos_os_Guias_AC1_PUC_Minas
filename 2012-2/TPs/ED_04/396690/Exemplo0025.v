// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
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
module comp2 (output [4:0] s, 
input [3:0] a, 
input [3:0] b, 
input carryIn);


wire s0v1,s0v2,s0v3,s1v1,s1v2,s1v3;


fullAdder ad1 (s[0], s1v1, a[0], ~b[0], carryIn);
fullAdder ad2 (s[1], s1v2, a[1], ~b[1], s1v1);
fullAdder ad3 (s[2], s1v3, a[2], ~b[3], s1v2);
fullAdder ad4 (s[3], s[4], a[3], ~b[3], s1v3);



endmodule

module test_fullAdder; 
// ------------------------- definir dados 

reg [3:0] y; 
reg [3:0] x;
reg c;
wire [4:0] s; 
comp2 s1 (s, x, y, c);
// ------------------------- parte principal 

initial begin 
$display("Exemplo0025 - Gabriel Benjamim de Carvalho - 396690"); 
$display("Test ALU's full adder"); 
x = 4'b0001; y = 4'b1101; c = 1'b0;
#1 $display("%4b = complemento de 2.: %5b", y, s);  
end 
endmodule // test_fullAdder 