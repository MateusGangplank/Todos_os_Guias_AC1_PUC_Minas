 // ------------------------- 
// Exemplo0025 - C2 gate 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// C2 gate
// ------------------------- 
module Adder (output s0, 
output s1,
input a, 
input b);
xor XOR1 (s0,a,b);
and AND1 (s1,a,b);
endmodule//Adder

module fullAdder (output s2,
output Carry_out,
input Carry_in,
input x,
input y);
wire temp1,temp2,temp3;
Adder A1 (temp1,temp2,x,y);
Adder A2 (s2,temp3,temp1,Carry_in);
or OR1(Carry_out,temp3,temp2);
endmodule//fullAdder

module Prin (output [3:0] s,
output Carry_out,
input Carry_in,
input [3:0] x1,
input y);
wire temp4,temp5,temp6,Nx0,Nx1,Nx2,Nx3;
not NOT1 (Nx0,x1[0]);
not NOT2 (Nx1,x1[1]);
not NOT3 (Nx2,x1[2]);
not NOT4 (Nx3,x1[3]);
fullAdder fA1(s[0],temp4,Carry_in,Nx0,y);
fullAdder fA2(s[1],temp5,temp4,Nx1,y);
fullAdder fA3(s[2],temp6,temp5,Nx2,y);
fullAdder fA4(s[3],Carry_out,temp6,Nx3,y);
endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg [3:0] x;
reg y;
reg  v;
wire [3:0] s;
wire Carry_out; 
Prin modulo ( s, Carry_out,v, x, y);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0025 - Lucas Cardoso - 441694"); 
$display("Test AU's module"); 
x = 4'b0000; v = 'b1; y = 0; 
// projetar testes do modulo 
$display("\na b Carry_in Carr_out s");
#1 $monitor("%b %b %b %b",x,v,Carry_out,s);
#1 x='b0001; v= 'b1;  
#1 x='b0010; v= 'b1;
#1 x='b0011; v= 'b1;

#1 x='b0100; v= 'b1; 
#1 x='b0101; v= 'b1;  
#1 x='b0110; v= 'b1;
#1 x='b0111; v= 'b1;

#1 x='b1000; v= 'b1; 
#1 x='b1001; v= 'b1;  
#1 x='b1010; v= 'b1;
#1 x='b1011; v= 'b1;

#1 x='b1100; v= 'b1; 
#1 x='b1101; v= 'b1;  
#1 x='b1110; v= 'b1;
#1 x='b1111; v= 'b1;

end 
endmodule // test