// ------------------------- 
// Exemplo0032 - F4 
// Nome: José Ferreira Reis Fonseca
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// op1b 
// ------------------------- 
module op1b (output s, 
input a, 
input b, 
input c); 
// --descrição
wire s1, s2;

and and1 (s1, ~c, a);
and and2 (s2, c, b);
or or1 (s, s1, s2);

endmodule // op1b 
// ------------------------- 
// ------------------------- 
// op4b 
// ------------------------- 
module op4b (output [3:0] s, 
input [3:0] a, 
input [3:0] b,
input c); 
// --descrição

op1b op1 (s[0], a[0], b[0], c);
op1b op2 (s[1], a[1], b[1], c);
op1b op3 (s[2], a[2], b[2], c);
op1b op4 (s[3], a[3], b[3], c);

endmodule // op4b 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, 
input [3:0] a, 
input [3:0] b,
input c); 
// -- descrição
wire [3:0] fioAND, fioOR;

and and1 (fioAND[0], a[0], b[0]);
and and2 (fioAND[1], a[1], b[1]);
and and3 (fioAND[2], a[2], b[2]);
and and4 (fioAND[3], a[3], b[3]);

or or1 (fioOR[0], a[0], b[0]);
or or2 (fioOR[1], a[1], b[1]);
or or3 (fioOR[2], a[2], b[2]);
or or4 (fioOR[3], a[3], b[3]);

op4b op1 (s, fioAND, fioOR, c);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg c;
wire [3:0] z; 
f4 modulo (z, x, y, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; c=0;
// projetar testes do modulo 
#1 $monitor("%3b %3b option: %1b == %3b",x,y,c,z); 
#1 c=1;
#1 x = 4'b1010; y = 4'b1101; c=0;
#1 x = 4'b1010; y = 4'b1101; c=1;
#1 x = 4'b1111; y = 4'b1111; c=0;
#1 x = 4'b1111; y = 4'b1111; c=1;
#1 x = 4'b0000; y = 4'b0000; c=0;
#1 x = 4'b0000; y = 4'b0000; c=1;
#1 x = 4'b1010; y = 4'b0101; c=0;
#1 x = 4'b1010; y = 4'b0101; c=1;
end 
endmodule // test_f4 