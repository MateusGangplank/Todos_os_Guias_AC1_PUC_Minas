// ------------------------- 
// Exemplo0032 - F4 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [1:0] s, 
input [1:0] a, 
input [1:0] b, 
input c); 

wire w1,w2,w3,w4,w5,w6,w7,w8;

or or1 (w1, a[0], b[0]);
and and1 (w2,a[0],b[0]);
or or2 (w3, a[1], b[1]);
and and2 (w4, a[1], b[1]);
and and3 (w5, ~c, w1);
and and4 (w6, c, w2);
and and5 (w7, ~c, w3);
and and6 (w8, c, w4);
or or3 (s[0], w5, w6);
or or4 (s[1], w7, w8);


endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg w; 
reg [1:0] x; 
reg [1:0] y; 
wire [1:0] z; 
f4 modulo (z, x, y, w); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
$display("1-and, 0-or"); 
x = 2'b11; y = 2'b01; w = 1'b0;
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 1'b1;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
end 
endmodule // test_f4 