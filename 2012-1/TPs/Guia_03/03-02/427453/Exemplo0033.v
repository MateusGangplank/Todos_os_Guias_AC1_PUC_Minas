// ------------------------- 
// Exemplo0033 - F4 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [1:0] s, 
input [1:0] a, 
input [1:0] b, 
input [1:0] c); 

wire w1,w2,w3,w4,w5,w6,w7,w8;
wire q1,q2,q3,q4;

or or1 (w1, a[0], b[0]);
and and1 (w2,a[0],b[0]);
or or2 (w3, a[1], b[1]);
and and2 (w4, a[1], b[1]);
xor xor1 (q1, w1, c[1]);
xor xor2 (q2, w2, c[1]);
xor xor3 (q3, w3, c[1]);
xor xor4 (q4, w4, c[1]);
and and3 (w5, ~c[0], q1);
and and4 (w6, c[0], q2);
and and5 (w7, ~c[0], q3);
and and6 (w8, c[0], q4);
or or3 (s[0], w5, w6);
or or4 (s[1], w7, w8);


endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [1:0] w; 
reg [1:0] x; 
reg [1:0] y; 
wire [1:0] z; 
f4 modulo (z, x, y, w); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
$display("01-and, 00-or, 11-nand, 10-nor"); 
x = 2'b11; y = 2'b01; w = 2'b00;
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 2'b01;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 21'b10;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 2'b11;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
end 
endmodule // test_f4 