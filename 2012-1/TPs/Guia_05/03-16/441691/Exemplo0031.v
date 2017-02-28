// ------------------------- 
// Exemplo0031 - complemento1 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// somador_gate 
// -------------------------

module C1 (output  s,
input  a, 
input  b);

xor XOR1 (s,a,b);

endmodule//C1 

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

module somador (output  s0, output  s1, output  s2, output  s3, output  s4,
input  [3:0] a, 
input  [3:0] b,
input c);

wire w,p,q,r;
wire [3:0] z;
C1 c0(z[0],c,b[0]);
C1 c1(z[1],c,b[1]);
C1 c2(z[2],c,b[2]);
C1 c3(z[3],c,b[3]);
fulladder FA1(s0,w,a[0],z[0],c);
fulladder FA2(s1,p,a[1],z[1],w);
fulladder FA3(s2,q,a[2],z[2],p);
fulladder FA4(s3,r,a[3],z[3],q);
C1 c4(s4,r,c);

endmodule//somador

module test_somador; 
// ------------------------- definir dados 
reg [3:0] y,z;  
reg c;
wire g,h,i,j,k;
somador modulo1 (g,h,i,j,k,y,z,c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b0000; c = 'b0;
// projetar testes do modulo 
#1 $monitor("%4b  %4b  %1b = %1b %4b%4b%4b%4b ",y,z,c,k,j,i,h,g);
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

#1 z = 4'b0000; y = 4'b0000; c = 'b1;
#1 z = 4'b0001; y = 4'b0000; c = 'b1;
#1 z = 4'b0001; y = 4'b0001; c = 'b1;
#1 z = 4'b0010; y = 4'b0001; c = 'b1;
#1 z = 4'b0010; y = 4'b0010; c = 'b1;
#1 z = 4'b0011; y = 4'b0010; c = 'b1;
#1 z = 4'b0011; y = 4'b0011; c = 'b1;
#1 z = 4'b0100; y = 4'b0011; c = 'b1;
#1 z = 4'b0100; y = 4'b0100; c = 'b1;
#1 z = 4'b0101; y = 4'b0100; c = 'b1;
#1 z = 4'b0101; y = 4'b0101; c = 'b1;
#1 z = 4'b0110; y = 4'b0101; c = 'b1;
#1 z = 4'b0110; y = 4'b0110; c = 'b1;
#1 z = 4'b0111; y = 4'b0110; c = 'b1;
#1 z = 4'b0111; y = 4'b0111; c = 'b1;
#1 z = 4'b1000; y = 4'b0111; c = 'b1;
#1 z = 4'b1000; y = 4'b1000; c = 'b1;
#1 z = 4'b1001; y = 4'b1000; c = 'b1;
#1 z = 4'b1001; y = 4'b1001; c = 'b1;
#1 z = 4'b1010; y = 4'b1001; c = 'b1;
#1 z = 4'b1010; y = 4'b1010; c = 'b1;
#1 z = 4'b1011; y = 4'b1010; c = 'b1;
#1 z = 4'b1011; y = 4'b1011; c = 'b1;
#1 z = 4'b1100; y = 4'b1011; c = 'b1;
#1 z = 4'b1100; y = 4'b1100; c = 'b1;
#1 z = 4'b1101; y = 4'b1100; c = 'b1;
#1 z = 4'b1101; y = 4'b1101; c = 'b1;
#1 z = 4'b1110; y = 4'b1101; c = 'b1;
#1 z = 4'b1110; y = 4'b1110; c = 'b1;
#1 z = 4'b1111; y = 4'b1110; c = 'b1;
#1 z = 4'b1111; y = 4'b1111; c = 'b1;

end 
endmodule // test_somador 