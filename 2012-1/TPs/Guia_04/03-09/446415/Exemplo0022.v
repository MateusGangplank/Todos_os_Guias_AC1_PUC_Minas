// ------------------------- 
// Exemplo0022 - FullDif 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// FullDif_gate 
// -------------------------
module Dif (output s0, output s1,input a, input b);

wire n;

not NOT1 (n,a);
xor XOR1 (s0,a,b);
and AND1 (s1,n,b);

endmodule//Dif

module fullDif (output s2,output Carry_out,input Carry_in,input x,input y);

wire temp1,temp2,temp3;

Dif D1 (temp1,temp2,x,y);
Dif D2 (s2,temp3,temp1,Carry_in);
or OR1(Carry_out,temp3,temp2);

endmodule//fullDif

module Prin (output [3:0] s,output sinal,input [3:0] x1,input [3:0] y1 ,input Carry_in);

wire temp4,temp5,temp6;

fullDif fD1(s[0],temp4,Carry_in,x1[0],y1[0]);
fullDif fD2(s[1],temp5,temp4,x1[1],y1[1]);
fullDif fD3(s[2],temp6,temp5,x1[2],y1[2]);
fullDif fD4(s[3],sinal,temp6,x1[3],y1[3]);

endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg [3:0] x;
reg [3:0] y;
reg  v;
wire [3:0] s;
wire sinal; 
Prin modulo ( s, sinal, x, y, v);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Filipe Viana de Miranda - 446415"); 
$display("Test AU's module"); 
x = 4'b0000; y = 4'b0000; v = 'b0; 
// projetar testes do modulo 
$display("\na b Carry_in sinal s");
#1 $monitor("%b %b %b %b %b",x,y,v,sinal,s);
#1 x='b0001;y ='b0001; v= 'b0;  
#1 x='b0010;y ='b0010; v= 'b0;
#1 x='b0011;y ='b0011; v= 'b0;

#1 x='b0100;y ='b0100; v= 'b0; 
#1 x='b0101;y ='b0101; v= 'b0;  
#1 x='b0110;y ='b0110; v= 'b0;
#1 x='b0111;y ='b0111; v= 'b0;

#1 x='b1000;y ='b1000; v= 'b0; 
#1 x='b1001;y ='b1001; v= 'b0;  
#1 x='b1010;y ='b1010; v= 'b0;
#1 x='b1011;y ='b1011; v= 'b0;

#1 x='b1100;y ='b1100; v= 'b0; 
#1 x='b1101;y ='b1101; v= 'b0;  
#1 x='b1110;y ='b1110; v= 'b0;
#1 x='b1111;y ='b1111; v= 'b0;

#1 x='b0000;y ='b0000; v= 'b1; 
#1 x='b0001;y ='b0001; v= 'b1;  
#1 x='b0010;y ='b0010; v= 'b1;
#1 x='b0011;y ='b0011; v= 'b1;

#1 x='b0100;y ='b0100; v= 'b1; 
#1 x='b0101;y ='b0101; v= 'b1;  
#1 x='b0110;y ='b0110; v= 'b1;
#1 x='b0111;y ='b0111; v= 'b1;

#1 x='b1000;y ='b1000; v= 'b1; 
#1 x='b1001;y ='b1001; v= 'b1;  
#1 x='b1010;y ='b1010; v= 'b1;
#1 x='b1011;y ='b1011; v= 'b1;

#1 x='b1100;y ='b1100; v= 'b1; 
#1 x='b1101;y ='b1101; v= 'b1;  
#1 x='b1110;y ='b1110; v= 'b1;
#1 x='b1111;y ='b1111; v= 'b1;


end 
endmodule // test_FullDif 