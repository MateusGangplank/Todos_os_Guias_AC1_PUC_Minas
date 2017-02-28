// ------------------------- 
// Exemplo0035 - complemento1 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// somador_gate 
// ------------------------- 

module AMB (output  s0,
input  a, 
input  b);
wire nb;

not NOT1(nb,b);
and AND1(s0,a,nb);

endmodule//AMB 

module AMB4 (output  s0,
input [3:0] a, 
input [3:0] b);
wire c0,c1,c2,c3;

AMB AMB0(c0,a[0],b[0]);
AMB AMB1(c1,a[1],b[1]);
AMB AMB2(c2,a[2],b[2]);
AMB AMB3(c3,a[3],b[3]);
or OR1(s0,c0,c1,c2,c3);

endmodule//AMB4 

module BMA (output  s0,
input  a, 
input  b);
wire na;

not NOT1(na,a);
and AND1(s0,na,b);

endmodule//BMA 

module BMA4 (output  s0,
input [3:0] a, 
input [3:0] b);
wire c0,c1,c2,c3;

BMA BMA0(c0,a[0],b[0]);
BMA BMA1(c1,a[1],b[1]);
BMA BMA2(c2,a[2],b[2]);
BMA BMA3(c3,a[3],b[3]);
or OR1(s0,c0,c1,c2,c3);

endmodule//BMA4 

module igual (output  s0,
input  a, 
input  b);

xnor XNOR1(s0,a,b);

endmodule//igual 

module igual4 (output  s0,
input [3:0] a, 
input [3:0] b);
wire c0,c1,c2,c3;

igual igual0(c0,a[0],b[0]);
igual igual1(c1,a[1],b[1]);
igual igual2(c2,a[2],b[2]);
igual igual3(c3,a[3],b[3]);
and AND1(s0,c0,c1,c2,c3);

endmodule//igual4 

module main (output  s0, output  s1, output  s2,
input  [3:0] a, 
input  [3:0] b);

AMB4 A0(s0,a,b);
BMA4 B0(s1,a,b);
igual4 I0(s2,a,b);

endmodule//main

module test_main; 
// ------------------------- definir dados 
reg [3:0] y,z;  
wire g,h,i;
main modulo1 (g,h,i,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
y = 4'b0000; z = 4'b0000;
// projetar testes do modulo
   $display("  a    b    A>B  B>A  Igual");  
#1 $monitor("%4b  %4b = %1b   %1b   %1b ",y,z,g,h,i);
#1 y = 4'b0001; z = 4'b0000;
#1 y = 4'b0101; z = 4'b0010;  
#1 y = 4'b0111; z = 4'b0100;  
#1 y = 4'b0000; z = 4'b0010;  
#1 y = 4'b0011; z = 4'b0100;  
#1 y = 4'b0100; z = 4'b0111;  
#1 y = 4'b0001; z = 4'b0001;  
#1 y = 4'b0101; z = 4'b0101;  
#1 y = 4'b0111; z = 4'b0111;  
end 
endmodule // test_somador 

//funcional em circuitos, mas aki da erro