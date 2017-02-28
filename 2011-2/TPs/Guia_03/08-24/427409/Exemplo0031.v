// ------------------------- 
// Exemplo0031 -  AND/OR gate (simultaneamente)
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// AND/OR gate (simultaneamente)
// ------------------------- 
module f4 (output [3:0] s0,
output [3:0] s1,
output [7:0] s2, 
input [3:0] a, 
input [3:0] b); 
// descrever por portas 
assign s0 = (a | b);
assign s1 = (a & b);
assign s2 = s0 + s1;
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] z;
wire [3:0] w;
wire [7:0] q; 
f4 modulo (z, w , q , x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Guilherme Rodrigues Melo de Oliveira - 427409 ");  
$display("Test LU's module"); 
x = 4'b1101; y = 4'b1010; 
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b %7b",x,y,z,w,q); 
end 
endmodule // test_f4 