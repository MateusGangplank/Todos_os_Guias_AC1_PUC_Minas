// ------------------------- 
// Exemplo0031 - F4 
// Nome: José Ferreira Reis Fonseca
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] sand,
output [3:0] sor, 
input [3:0] a, 
input [3:0] b); 
// -- descrição

and and1 (sand[0], a[0], b[0]);
and and2 (sand[1], a[1], b[1]);
and and3 (sand[2], a[2], b[2]);
and and4 (sand[3], a[3], b[3]);

or or1 (sor[0], a[0], b[0]);
or or2 (sor[1], a[1], b[1]);
or or3 (sor[2], a[2], b[2]);
or or4 (sor[3], a[3], b[3]);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] z, w; 
f4 modulo (w, z, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo 
#1 $monitor("%3b %3b == AND %3b OR %3b",x,y,w,z); 
#1 x = 4'b1010; y = 4'b1101;
#1 x = 4'b1111; y = 4'b1111;
#1 x = 4'b0000; y = 4'b0000;
#1 x = 4'b1010; y = 4'b0101;
end 
endmodule // test_f4 