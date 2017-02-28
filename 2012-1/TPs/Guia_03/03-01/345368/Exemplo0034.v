// ------------------------- 
// Exemplo0034 - F4 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input c1, input c2);  
assign s = (~a & ~b & c2) | (~a & b & ~c2) | (a & ~b & ~c2) | (a & ~c1 & ~c2) | (a & b & c1 & c2);
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg a; 
reg b;
reg c1;
reg c2;
wire s; 
f4 modulo1 (s, a, b, c, c2); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Marcio Santana Correa - 345368"); 
$display("Test LU's module"); 
a = 1; b = 0; c1 = 0; c2 = 0;
// projetar testes do modulo 
$display("A  B  C1 C2 S");
$monitor("%b  %b  %b  %b  %b",a, b, c1, c2, s);
#1 a = 0; b = 1; c1 = 1; c2 = 0;
#1 a = 1; b = 0; c1 = 0; c2 = 1;
#1 a = 0; b = 1; c1 = 1; c2 = 1;
end 
endmodule // test_f4 