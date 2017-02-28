// -------------------------
// Exemplo0035 - F4 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input c1, input c2, input c3);  
assign s = (~a & ~b & ~c3) | (~a & b & ~c2) | (a & ~b & ~c2) | (a & b & ~c1 & c3) | (a & b & c1 & c2);
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg a; 
reg b;
reg c1;
reg c2;
reg c3;
wire s; 
f4 modulo1 (s, a, b, c, c2, c3); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Guilherme Moreira Nunes - 408947"); 
$display("Test LU's module"); 
a = 1; b = 0; c1 = 0; c2 = 0; c3 = 1;
// projetar testes do modulo 
$display("A  B  C1 C2 C3 S");
$monitor("%b  %b  %b  %b  %b  %b",a, b, c1, c2, c3, s);
#1 a = 0; b = 1; c1 = 1; c2 = 0; c3 = 0;
#1 a = 1; b = 0; c1 = 0; c2 = 1; c3 = 1;
#1 a = 0; b = 1; c1 = 1; c2 = 1; c3 = 0;
end 
endmodule // test_f4 

// OBS.: USAR PORTAS !!!
