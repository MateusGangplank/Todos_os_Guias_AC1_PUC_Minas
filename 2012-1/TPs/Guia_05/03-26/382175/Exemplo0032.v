// ------------------------- 
// Exemplo0032
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

module Zero (output s, input a, input b,
             input c, input d, input e);

nor NOR1 (s,a,b,c,d,e);

endmodule // Zero
				 
module SA (output s, input f1, input f2);

xor XOR1 (s,f1,f2); 

endmodule // SA

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

module Selecionador (output s1, input[3:0] a,
                     input[3:0] b, input carry);
wire  w1,w2,w3,w4,p1,p2,p3,p4;
wire[4:0] s;
SA c1 (w1,b[0],carry);
SA c2 (w2,b[1],carry);
SA c3 (w3,b[2],carry);
SA c4 (w4,b[3],carry);
FullAdder FU1 (s[0],p1,a[0],w1,carry);
FullAdder FU2 (s[1],p2,a[1],w2,p1);
FullAdder FU3 (s[2],p3,a[2],w3,p2);
FullAdder FU4 (s[3],p4,a[3],w4,p3);
SA c5 (s[4],p4,carry);
Zero Z1 (s1,s[0],s[1],s[2],s[3],s[4]);

endmodule // Selecionador

module test_SA2; 

// ------------------------- definir dados 

reg[3:0] x, y;
reg z;  
wire q;

Selecionador modulo (q, x, y, z); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0032 - Oswaldo Oliveira Paulino - 382175"); 
$display("Test LU's module"); 

x = 4'b0000; y = 4'b0000; z = 'b0;

// projetar testes do modulo 
#1 $display("\n a    b   carry  s"); 
#1 $monitor("%4b %4b   %b    %b" ,x,y,z,q); 

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
endmodule