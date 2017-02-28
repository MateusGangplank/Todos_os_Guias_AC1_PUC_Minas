// ------------------------- 
// Exemplo0034 - EX4 
// Nome: Luhan Mairinck Reis 
// Matricula: 446987
// ------------------------- 

// ------------------------- 
// EX4_gate 
// ------------------------- 


module Adder (output s1, output s2, input a, input b);

xor XOR1 (s2,a,b);
and AND1 (s1,a,b);				 				

endmodule // Adder

module  FullAdder (output s3, output s4,input e1, input e2, input c);
wire p1, p2,p3;

Adder HA1 (p1,p2,e1,e2);
Adder HA2 (s3,p3,p1,c);
xor XOR1 (s4,p3,p2);

endmodule // FullAdder

module DEC (output[2:0] s, input a,
            input b, input c, input Carry_in);
wire f1,f2,f3;

FullAdder FA1 (s[0],f1,a,1,Carry_in);
FullAdder FA2 (s[1],f2,b,1,f1);
FullAdder FA3 (s[2],f3,c,1,f2);

endmodule // DEC

module FullAdder2 (output sinal, output[2:0] s, input[3:0] a,
                   input[3:0] b, input carry);
wire  w1,w2,w3,w4,p1,p2,p3,p4;
wire[4:0] p;

FullAdder FA1 (p[0],p1,a[0],b[0],carry);
FullAdder FA2 (p[1],p2,a[1],b[1],p1);
FullAdder FA3 (p[2],p3,a[2],b[2],p2);
FullAdder FA4 (sinal,p4,a[3],b[3],p3);
DEC Dec1 (s[2:0],p[0],p[1],p[2],carry);
endmodule // FullAdder2

module test_EX4; 

// ------------------------- definir dados 

reg[3:0] x, y;
reg z;  
wire [2:0]q;
wire sinal;

FullAdder2 modulo (sinal, q, x, y, z); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0033 - Luhan Mairinck Reis - 446987"); 
$display("Test LU's module"); 

x = 4'b0000; y = 4'b0000; z = 'b0;

// projetar testes do modulo 
#1 $display("\n a    b   carry  sinal   s"); 
#1 $monitor("%4b %4b   %b    %b   %4b" ,x,y,z,sinal,q); 

#1 x = 4'b0001; y = 4'b0000; z = 'b0;
#1 x = 4'b0001; y = 4'b0001; z = 'b0;
#1 x = 4'b0010; y = 4'b0001; z = 'b0;
#1 x = 4'b0010; y = 4'b0010; z = 'b0;
#1 x = 4'b0011; y = 4'b0010; z = 'b0;
#1 x = 4'b0011; y = 4'b0011; z = 'b0;
#1 x = 4'b0100; y = 4'b0011; z = 'b0;
#1 x = 4'b0100; y = 4'b0100; z = 'b0;
#1 x = 4'b0101; y = 4'b0100; z = 'b0;
#1 x = 4'b0101; y = 4'b0101; z = 'b0;
#1 x = 4'b0110; y = 4'b0101; z = 'b0;
#1 x = 4'b0110; y = 4'b0110; z = 'b0;
#1 x = 4'b0111; y = 4'b0110; z = 'b0;
#1 x = 4'b0111; y = 4'b0111; z = 'b1;
#1 x = 4'b1000; y = 4'b0111; z = 'b1;
#1 x = 4'b1000; y = 4'b1000; z = 'b1;
#1 x = 4'b1001; y = 4'b1000; z = 'b1;
#1 x = 4'b1001; y = 4'b1001; z = 'b1;
#1 x = 4'b1010; y = 4'b1001; z = 'b1;
#1 x = 4'b1010; y = 4'b1010; z = 'b1;
#1 x = 4'b1011; y = 4'b1010; z = 'b1;
#1 x = 4'b1011; y = 4'b1011; z = 'b1;
#1 x = 4'b1100; y = 4'b1011; z = 'b1;
#1 x = 4'b1100; y = 4'b1100; z = 'b1;
#1 x = 4'b1101; y = 4'b1100; z = 'b1;
#1 x = 4'b1101; y = 4'b1101; z = 'b1;
#1 x = 4'b1110; y = 4'b1101; z = 'b1;
#1 x = 4'b1110; y = 4'b1110; z = 'b1;
#1 x = 4'b1111; y = 4'b1110; z = 'b1;
#1 x = 4'b1111; y = 4'b1111; z = 'b1;


end 
endmodule // test_EX2 