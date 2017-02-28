// ------------------------- 
// Exemplo0031 - F4 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input c, input d, input c1, input c2);  
assign s = ((a & ~c1 & ~c2) | (b & ~c1 & c2) | (c & c1 & ~c2) | (d & c1 & c2));
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg a; 
reg b;
reg c;
reg d; 
reg c1;
reg c2;
wire s; 
f4 modulo1 (s, a, b, c, d, c1, c2); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Guilherme Moreira Nunes - 408947"); 
$display("Test LU's module"); 
a = 1; b = 1; c = 0; d = 1; c1 = 0; c2 = 0;
$display("S0 S1 S2 S3 |C1 C2| S");
$monitor("%b  %b  %b  %b  |%b   %b|  %b", a, b, c, d, c1, c2, s);
#1 a = 1; b = 0; c = 0; d = 1; c1 = 0; c2 = 1;
#1 a = 1; b = 0; c = 1; d = 0; c1 = 1; c2 = 0;
#1 a = 1; b = 0; c = 1; d = 0; c1 = 1; c2 = 1;
end 
endmodule // test_f4 