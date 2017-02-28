// ------------------------- 
// Exemplo0035 - F4 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, 
input a, 
input b, 
input [2:0] c); 

wire w1,w2,w3,w4,w5,w6,w7,w8;
wire q1,q2,q3,q4,q5,q6,q7,q8;

or or1 (w1, a, b);
nor nor1 (w4, a, b);
xor xor1 (w2, a, b);
xnor xnor1 (w5, a, b);
and and1 (w3, a, b);
nand nand1 (w6, a, b);
not not1 (w7, a);
not not2 (w8, b);

and and2 (q1, w1, ~c[0], ~c[1], ~c[2]);  
and and3 (q2, w2, c[0], ~[1], ~[2]);
and and4 (q3, w3, ~c[0], c[1], ~c[2]);
and and5 (q4, w4, c[0], c[1], ~c[2]);
and and6 (q5, w5, ~c[0], ~[1], c[2]);
and and7 (q6, w6, c[0], ~c[1], c[2]);
and and8 (q7, w7, ~c[0], c[1], c[2]);
and and9 (q8, w8, c[0], c[1], c[2]);

or or2 (s, q1, q2, q3, q4, q5, q6, q7, q8);


endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [2:0] w; 
reg x; 
reg y; 
wire z; 
f4 modulo (z, x, y, w); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
$display("000-or, 001-nor, 010-xor, 011-xnor, 100-and, 101-nand, 110-not a, 111-not b"); 
x = 1'b1; y = 1'b0; w = 3'b000;
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 3'b001;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 3'b010;
#1 $display("%3b %3b %3b %3b",x,y,w,z); 
 w = 3'b011;
#1 $display("%3b %3b %3b %3b",x,y,w,z);
 w = 3'b100;
#1 $display("%3b %3b %3b %3b",x,y,w,z);
 w = 3'b101;
#1 $display("%3b %3b %3b %3b",x,y,w,z);
 w = 3'b110;
#1 $display("%3b %3b %3b %3b",x,y,w,z);
 w = 3'b111;
#1 $display("%3b %3b %3b %3b",x,y,w,z);
end 
endmodule // test_f4 

// nao compilado