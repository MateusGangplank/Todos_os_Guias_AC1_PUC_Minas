// ------------------------- 
// Exemplo0022 - diferenciador 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
// ------------------------- 
// diferenciador_gate 
// ------------------------- 

module MD (output  s0, output s1,
input  a, 
input  b);
wire nb;

not NOT1 (nb,b);
xor XOR1 (s0,a,b);
and AND1 (s1,a,nb);

endmodule//MD

module FD (output  s0, output s1,
input  a, 
input  b,
input  c);
wire x,y,z;

MD AD1 (x,y,a,b);
MD AD2 (s0,z,x,c);
and AND1 (s1,z,y);

endmodule//FD

module diferenciador (output  s0, output  s1, output  s2,
input  [2:0] a, 
input  [2:0] b,
input c);

wire o,m,n,w,p,q;

xor XOR1(o,b[0],c);
xor XOR2(m,a[1],c);
xor XOR3(n,b[2],c);
FD FD1(s0,w,a[0],o,c);
FD FD2(s1,p,b[1],m,w);
FD FD3(s2,q,a[2],n,p);

endmodule//diferenciador

module test_diferenciador; 
// ------------------------- definir dados 
reg [2:0] y,z;  
reg c;
wire g,h,i;
diferenciador modulo1 (g,h,i,y,z,c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Luhan Mairinck - 446987"); 
$display("Test LU's module"); 
y = 3'b000; z = 3'b000; c = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b  %3b  %3b = %3b%3b%3b ",z,y,c,i,h,g);
#1 y = 3'b001; z = 3'b000; c = 'b0;
#1 y = 3'b001; z = 3'b001; c = 'b0;
#1 y = 3'b010; z = 3'b001; c = 'b0;
#1 y = 3'b010; z = 3'b010; c = 'b0;
#1 y = 3'b011; z = 3'b010; c = 'b0;
#1 y = 3'b011; z = 3'b011; c = 'b0;
#1 y = 3'b100; z = 3'b011; c = 'b0;
#1 y = 3'b100; z = 3'b100; c = 'b0;
#1 y = 3'b101; z = 3'b100; c = 'b0;
#1 y = 3'b101; z = 3'b101; c = 'b0;
#1 y = 3'b110; z = 3'b101; c = 'b0;
#1 y = 3'b110; z = 3'b110; c = 'b0;
#1 y = 3'b111; z = 3'b110; c = 'b0;
#1 y = 3'b111; z = 3'b111; c = 'b0;
#1 y = 3'b000; z = 3'b111; c = 'b0;
#1 y = 3'b000; z = 3'b000; c = 'b1;
#1 y = 3'b001; z = 3'b000; c = 'b1;
#1 y = 3'b001; z = 3'b001; c = 'b1;
#1 y = 3'b010; z = 3'b001; c = 'b1;
#1 y = 3'b010; z = 3'b010; c = 'b1;
#1 y = 3'b011; z = 3'b010; c = 'b1;
#1 y = 3'b011; z = 3'b011; c = 'b1;
#1 y = 3'b100; z = 3'b011; c = 'b1;
#1 y = 3'b100; z = 3'b100; c = 'b1;
#1 y = 3'b101; z = 3'b100; c = 'b1;
#1 y = 3'b101; z = 3'b101; c = 'b1;
#1 y = 3'b110; z = 3'b101; c = 'b1;
#1 y = 3'b110; z = 3'b110; c = 'b1;
#1 y = 3'b111; z = 3'b110; c = 'b1;
#1 y = 3'b111; z = 3'b111; c = 'b1;
end 
endmodule // test_diferenciador 