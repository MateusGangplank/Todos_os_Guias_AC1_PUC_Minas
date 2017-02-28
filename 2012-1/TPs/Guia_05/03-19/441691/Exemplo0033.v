// ------------------------- 
// Exemplo0033 - complemento1 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// somador_gate 
// ------------------------- 

module Inc1 (output  s0, output  s1, output  s2,
input  a, 
input  b,
input  c,
input carryI);
wire carryO,c1,c2;

fulladder FA1(s0,c1,a,1,carryI);
fulladder FA2(s1,c2,b,0,c1);
fulladder FA3(s2,carryO,c,0,c2);

endmodule//Inc1 

module C1 (output  s,
input  a, 
input  b);

xor XOR1 (s,a,b);

endmodule//C1 

module Zero (output  s,
input  a, 
input  b,
input c);

nor NOR1 (s,a,b,c);

endmodule//Zero 


module adder (output  s0, output s1,
input  a, 
input  b);

xor XOR1 (s0,a,b);
and AND1 (s1,a,b);

endmodule//adder

module fulladder (output  s0, output s1,
input  a, 
input  b,
input  c);
wire x,y,z;

adder AD1 (x,y,a,b);
adder AD2 (s0,z,x,c);
or OR1 (s1,z,y);

endmodule//fulladder

module somador (output  s0, output  s1, output  s2, output  s3,
input  [3:0] a, 
input  [3:0] b,
input c);

wire w,p,q,r,a0,a1,a2;
fulladder FA1(a0,w,a[0],b[0],c);
fulladder FA2(a1,p,a[1],b[1],w);
fulladder FA3(a2,q,a[2],b[2],p);
fulladder FA4(s3,r,a[3],b[3],q);

Inc1 I1(s0,s1,s2,a0,a1,a2,c);

endmodule//somador

module test_somador; 
// ------------------------- definir dados 
reg [3:0] y,z;  
reg c;
wire g,h,i,j;
somador modulo1 (g,h,i,j,y,z,c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b0000; c = 'b0;
// projetar testes do modulo 
#1 $monitor("%4b  %4b  %1b = %1b %4b%4b%4b ",y,z,c,j,i,h,g);
#1 y = 4'b0001; z = 4'b0000; c = 'b0;
#1 y = 4'b0001; z = 4'b0001; c = 'b0;
#1 y = 4'b0010; z = 4'b0001; c = 'b0;
#1 y = 4'b0010; z = 4'b0010; c = 'b0;
#1 y = 4'b0011; z = 4'b0010; c = 'b0;
#1 y = 4'b0011; z = 4'b0011; c = 'b0;
#1 y = 4'b0100; z = 4'b0011; c = 'b0;
#1 y = 4'b0100; z = 4'b0100; c = 'b0;
#1 y = 4'b0101; z = 4'b0100; c = 'b0;
#1 y = 4'b0101; z = 4'b0101; c = 'b0;
#1 y = 4'b0110; z = 4'b0101; c = 'b0;
#1 y = 4'b0110; z = 4'b0110; c = 'b0;
#1 y = 4'b0111; z = 4'b0110; c = 'b0;
#1 y = 4'b0111; z = 4'b0111; c = 'b0;
#1 y = 4'b1000; z = 4'b0111; c = 'b0;
#1 y = 4'b1000; z = 4'b1000; c = 'b0;
#1 y = 4'b1001; z = 4'b1000; c = 'b0;
#1 y = 4'b1001; z = 4'b1001; c = 'b0;
#1 y = 4'b1010; z = 4'b1001; c = 'b0;
#1 y = 4'b1010; z = 4'b1010; c = 'b0;
#1 y = 4'b1011; z = 4'b1010; c = 'b0;
#1 y = 4'b1011; z = 4'b1011; c = 'b0;
#1 y = 4'b1100; z = 4'b1011; c = 'b0;
#1 y = 4'b1100; z = 4'b1100; c = 'b0;
#1 y = 4'b1101; z = 4'b1100; c = 'b0;
#1 y = 4'b1101; z = 4'b1101; c = 'b0;
#1 y = 4'b1110; z = 4'b1101; c = 'b0;
#1 y = 4'b1110; z = 4'b1110; c = 'b0;
#1 y = 4'b1111; z = 4'b1110; c = 'b0;
#1 y = 4'b1111; z = 4'b1111; c = 'b0;
end 
endmodule // test_somador 