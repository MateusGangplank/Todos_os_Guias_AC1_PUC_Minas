 // ------------------------- 
// Exemplo0033 - FullAdder 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// FullAdder
// ------------------------- 
module Adder (output s0, 
output s1,
input a, 
input b);
xor XOR1 (s0,a,b);
and AND1 (s1,a,b);
endmodule//Adder

module Increment (output [1:0] s,
output Carry_out,
input x,
input y,
input Carry_in);
wire t1;
fullAdder fA5 (s[0],t1,Carry_in,x,1);
fullAdder fA6 (s[1],Carry_out,t1,y,0);
endmodule//Increment

module C1 (output s1,
input a,
input b);
xor XOR2(s1,a,b);
endmodule//C1

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

module Prin (output [2:0] s,
output sinal,
input [2:0] x1,
input [2:0] y1,
input Carry_in);
wire temp4,temp5,c0,c1,c2,c3;
wire [2:0] ts,c_out;
C1 C0 (c0,Carry_in,y1[0]);
C1 C1 (c1,Carry_in,y1[1]);
C1 C2 (c2,Carry_in,y1[2]);
fullAdder fA1(ts[0],temp4,Carry_in,x1[0],c0);
fullAdder fA2(ts[1],temp5,temp4,x1[1],c1);
fullAdder fA3(ts[2],Carry_out,temp5,x1[2],c2);
C1 C3 (sinal,Carry_out,Carry_in);
Increment I1 (s[1:0],s[2],ts[0],ts[1],ts[2]);
endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg [2:0] x;
reg [2:0] y;
reg  v;
wire [2:0] s;
wire sinal,Carry_out; 
Prin modulo ( s, sinal, x, y, v);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Lucas Cardoso - 441694"); 
$display("Test AU's module"); 
x = 3'b000; y = 3'b000; v = 'b0; 
// projetar testes do modulo 
$display("\na b Carry_in sinal s");
#1 $monitor("%b %b %b %b %b",x,y,v,sinal,s);
#1 x='b000;y ='b000; v= 'b0;  
#1 x='b001;y ='b001; v= 'b0;
#1 x='b010;y ='b010; v= 'b0;
#1 x='b011;y ='b011; v= 'b0;
 
#1 x='b100;y ='b100; v= 'b0;  
#1 x='b101;y ='b101; v= 'b0;
#1 x='b110;y ='b110; v= 'b0;
#1 x='b111;y ='b111; v= 'b0; 

#1 x='b000;y ='b000; v= 'b1; 
#1 x='b001;y ='b001; v= 'b1;  
#1 x='b010;y ='b010; v= 'b1;
#1 x='b011;y ='b011; v= 'b1;

#1 x='b100;y ='b100; v= 'b1; 
#1 x='b101;y ='b101; v= 'b1;  
#1 x='b110;y ='b110; v= 'b1;
#1 x='b111;y ='b111; v= 'b1;

end 
endmodule // test_FullAdder 