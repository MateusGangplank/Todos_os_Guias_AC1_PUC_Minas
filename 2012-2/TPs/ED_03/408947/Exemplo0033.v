// ------------------------- 
// Exemplo0033 - F4 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output s, input a, input b, input c, input se);  
assign s = (b & ~c & se) | (b & c & ~se) | (a & ~c & ~se) | (a & c & se);
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg a; 
reg b;
reg c;
reg se;
wire s; 
f4 modulo1 (s, a, b, c, se); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Guilherme Moreira Nunes - 408947"); 
$display("Test LU's module"); 
a = 1; b = 0; c = 0; se = 0;
// projetar testes do modulo 
$display("S1 S2 C SE S");
$monitor("%b  %b  %b  %b  %b",a, b, c, se, s);
#1 a = 0; b = 1; c = 1; se = 0;
#1 a = 1; b = 0; c = 0; se = 1;
#1 a = 0; b = 1; c = 1; se = 1;
end 
endmodule // test_f4 