// ------------------------- 
// Exemplo0036 - F4 
// Nome: José Ferreira Reis Fonseca
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, 
input [3:0] a, 
input [3:0] b,
input c); 
// -- descrição
wire [3:0] fioXNOR;
wire sand;

xnor xnor1 (fioXNOR[0], a[0], b[0]);
xnor xnor2 (fioXNOR[1], a[1], b[1]);
xnor xnor3 (fioXNOR[2], a[2], b[2]);
xnor xnor4 (fioXNOR[3], a[3], b[3]);

and and1 (sand, fioXNOR[0], fioXNOR[1], fioXNOR[2], fioXNOR[3]);

xor xor5 (s, c, sand);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg c;
wire z; 
f4 modulo (z, x, y, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0036 - Jose Ferreira Reis Fonseca - 405808"); 
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