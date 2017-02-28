// ------------------------- 
// Exemplo0021 - somador 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
// ------------------------- 
// somador_gate 
// ------------------------- 

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

wire w,p,q,r;

fulladder FA1(s0,w,a[0],b[0],c);
fulladder FA2(s1,p,a[1],b[1],w);
fulladder FA3(s2,q,a[2],b[2],p);
fulladder FA4(s3,r,a[3],b[3],q);

endmodule//somador

module test_somador; 
// ------------------------- definir dados 
reg [3:0] y,z;  
reg c;
wire g,h,i,j;
somador modulo1 (g,h,i,j,y,z,c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Luhan Mairinck - 446987"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b0000; c = 'b0;
// projetar testes do modulo 
#1 $monitor("%4b  %4b  %4b = %4b%4b%4b%4b ",z,y,c,j,i,h,g);
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