// ------------------------- 
// Exemplo0032 - F4 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input c);  
assign s = (a & ~c) | (b & c) ;
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg a; 
reg b;
reg c;
wire s; 
f4 modulo1 (s, a, b, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Guilherme Moreira Nunes - 408947"); 
$display("Test LU's module"); 
a = 0; b = 0; c = 0;  
// projetar testes do modulo 
$display("S1 S2 C S");
$monitor("%b  %b  %b %b",a,b,c,s);
#1 a = 0; b = 0; c = 1;
#1 a = 0; b = 1; c = 0;
#1 a = 0; b = 1; c = 1;
#1 a = 1; b = 0; c = 0;
#1 a = 1; b = 0; c = 1;
#1 a = 1; b = 1; c = 0;
#1 a = 1; b = 1; c = 1;
end 
endmodule // test_f4 