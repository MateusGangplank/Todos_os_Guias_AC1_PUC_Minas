// ------------------------- 
// Exemplo0036 - F4 
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

wire w1,w2,w3;

and and1 (w1, a[0], b[0]);
and and2 (w2, a[1], b[1]);
or or1 (w3, w1, w2);
xor xor1 (s, w3, c);

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
$display("Exemplo0036 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
$display("0-equal 1-different"); 
$display(" a   b    op  result"); 
x = 2'b11; y = 2'b01; w = 2'b0;
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 2'b1;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
end 
endmodule // test_f4 