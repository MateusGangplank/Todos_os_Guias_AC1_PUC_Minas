// ------------------------- 
// Exemplo0035 - F4 
// Nome: José Ferreira Reis Fonseca
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// neg4b 
// ------------------------- 
module neg4b (output [3:0] s, 
input [3:0] a); 
// -- descrição

not not1 (s[0], a[0]);
not not2 (s[1], a[1]);
not not3 (s[2], a[2]);
not not4 (s[3], a[3]);

endmodule // neg4b
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] nota,
output [3:0] notb, 
output [3:0] ou,
output [3:0] notou,
output [3:0] e,
output [3:0] note,
output [3:0] oux,
output [3:0] notoux,
input [3:0] a, 
input [3:0] b); 
// -- descrição

neg4b neg4a (nota, a);
neg4b neg4b (notb, b);

and and1 (e[0], a[0], b[0]);
and and2 (e[1], a[1], b[1]);
and and3 (e[2], a[2], b[2]);
and and4 (e[3], a[3], b[3]);

neg4b neg4e (note, e);

or or1 (ou[0], a[0], b[0]);
or or2 (ou[1], a[1], b[1]);
or or3 (ou[2], a[2], b[2]);
or or4 (ou[3], a[3], b[3]);

neg4b neg4ou (notou, ou);

xor xor1 (oux[0], a[0], b[0]);
xor xor2 (oux[1], a[1], b[1]);
xor xor3 (oux[2], a[2], b[2]);
xor xor4 (oux[3], a[3], b[3]);

neg4b neg4oux (notoux, oux);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] a, b, c, d, e, f, g, h; 
f4 modulo (a, b, c, d, e, f, g, h, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo 
#1 $monitor("A %3b - B %3b == NOT A %3b - NOT B %3b - OR %3b - NOR %3b - \n AND %3b - NAND %3b - XOR %3b - XNOR %3b \n \n",x,y,a,b,c,d,e,f,g,h); 
#1 x = 4'b1010; y = 4'b1101;
#1 x = 4'b1111; y = 4'b1111;
#1 x = 4'b0000; y = 4'b0000;
#1 x = 4'b1010; y = 4'b0101;
end 
endmodule // test_f4 