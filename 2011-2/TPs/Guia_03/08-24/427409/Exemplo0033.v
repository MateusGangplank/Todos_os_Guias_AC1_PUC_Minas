// ------------------------- 
// Exemplo0033 -  AND/NAND NOR/OR gate (selecionavel)
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// AND/NAND NOR/OR gate (selecionavel)
// ------------------------- 
module f4 (output [3:0] s0,
output [3:0] s1,
output [3:0] s2,
output [3:0] s3,
input [3:0] a, 
input [3:0] b,
input [0:0] c); 
// descrever por portas 
assign s0 = (a | b);
assign s1 = (a & b) ;
assign s2 = ~(a | b);
assign s3 = ~(a & b);
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y;
reg [0:0] q; 
wire [3:0] z;
wire [3:0] w;
wire [3:0] t;
wire [3:0] p;

f4 modulo (z,w,t,p,x,y,q); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Guilherme Rodrigues Melo de Oliveira - 427409 ");  
$display("Test LU's module"); 
x = 4'b1101; y = 4'b1010; 
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b %3b %3b",x,y,z,w,t,p); 
end 
endmodule // test_f4 