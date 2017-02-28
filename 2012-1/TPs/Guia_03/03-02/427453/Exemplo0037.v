// ------------------------- 
// Exemplo0037 - F4 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, 
input [1:0] a, 
input [1:0] b, 
input c); 

wire w1,w2,w3,w4,w5,w6;

xor xor1 (w1, b[1], c);
xor xor2 (w2, a[1], ~c);
xor xor3 (w3, b[0], c);
xor xor4 (w4, a[0], ~c);
and and1 (w5, w1, w2);
and and2 (w6, w3, w4);
and and3 (s, w5, ~w6);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg w; 
reg [1:0] x; 
reg [1:0] y; 
wire z; 
f4 modulo (z, x, y, w); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0037 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
$display("0-menor 1-maior"); 
$display(" a   b    op  result"); 
x = 2'b11; y = 2'b01; w = 2'b0;
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 2'b1;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
end 
endmodule // test_f4 