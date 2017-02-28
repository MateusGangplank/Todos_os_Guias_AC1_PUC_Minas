// ------------------------- 
// Exemplo0025 - C2 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// C2_gate 
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
wire u,v,d;

adder AD1 (u,v,a,b);
adder AD2 (s0,d,u,c);
or OR1 (s1,d,v);

endmodule//fulladder

module C2 (output  s0, output  s1, output  s2, output s3, output s4,
input  [3:0] a, 
input  [3:0] b,
input c);

wire p,q,r,t;
wire [3:0] na;

not NOT1(na[0],a[0]);
not NOT2(na[1],a[1]);
not NOT3(na[2],a[2]);
not NOT4(na[3],a[3]);
fulladder FA1(s0,p,na[0],b[0],c);
fulladder FA2(s1,q,na[1],b[1],p);
fulladder FA3(s2,r,na[2],b[2],q);
fulladder FA4(s3,s4,na[2],b[3],r);

endmodule//C2

module test_C2; 
// ------------------------- definir dados 
reg [3:0] y,z;  
reg c;
wire g,h,i,j,k;
C2 modulo1 (g,h,i,j,k,y,z,c);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0025 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b1000; c = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b  %3b  %3b = %3b%3b%3b ",y,z,c,g,h,i);
#1 y = 4'b0001; c = 'b0;
#1 y = 4'b0010; c = 'b0;
#1 y = 4'b0011; c = 'b0;
#1 y = 4'b0100; c = 'b0;
#1 y = 4'b0101; c = 'b0;
#1 y = 4'b0110; c = 'b0;
#1 y = 4'b0111; c = 'b0;
#1 y = 4'b1000; c = 'b0;
#1 y = 4'b1001; c = 'b0;
#1 y = 4'b1010; c = 'b0;
#1 y = 4'b1011; c = 'b0;
#1 y = 4'b1100; c = 'b0;
#1 y = 4'b1101; c = 'b0;
#1 y = 4'b1110; c = 'b0;
#1 y = 4'b1111; c = 'b0;

end 
endmodule // test_C2 