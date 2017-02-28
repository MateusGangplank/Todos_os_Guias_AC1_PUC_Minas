// ------------------------- 
// Exemplo0033 -  NOT,OR,NOR,AND,NAND,XOR,XNOR  gate (simultaneos)
// Nome: Guilherme Rodrigues Melo de Oliveira 
// Matricula: 427409	
// ------------------------- 
// ------------------------- 
// NOT,OR,NOR,AND,NAND,XOR,XNOR  gate (simultaneos)
// ------------------------- 
module f4 (output [3:0] s0,
output [3:0] s1,
output [3:0] s2,
output [3:0] s3,
output [3:0] s4,
output [3:0] s5,
output [3:0] s6,
output [21:0] s7,
input [3:0] a, 
input [3:0] b); 
// descrever por portas 
assign s0 = ~a;
assign s1 = (a | b);
assign s2 = ~(a | b);
assign s3 = (a & b);
assign s4 = ~(a & b);
assign s5 = (a ^ b);
assign s6 = ~(a ^ b);
assign s7 = (s0 & s1 & s2 & s3 & s4 & s5 & s6);
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;
wire [3:0] t;
wire [3:0] p;
wire [3:0] q;
wire [3:0] r;
wire [3:0] u;
wire [21:0] i;

f4 modulo (z,w,t,p,q,r,u,i,x,y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Guilherme Rodrigues Melo de Oliveira - 427409 ");  
$display("Test LU's module"); 
x = 4'b1101; y = 4'b1010; 
// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b %3b %3b %3b %3b %3b",x,y,z,w,t,p,r,u,i); 
end 
endmodule // test_f4 