 // ------------------------- 
// Exemplo0023 - C_Igual 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// C_Igual
// ------------------------- 
module C_Igual (output s0,
input a, 
input b);
wire n,m,o,w;
not NOT1 (n,a);
not NOT2 (m,b);
and AND1 (o,n,m);
and AND2 (w,a,b);
or OR1 (s0,o,w);
endmodule//C_Igual

module Prin (output s,
input [3:0] x1,
input [3:0] y1);
wire temp1,temp2,temp3,temp4,temp5,temp6;
C_Igual CI1(temp1,x1[0],y1[0]);
C_Igual CI2(temp2,x1[1],y1[1]);
C_Igual CI3(temp3,x1[2],y1[2]);
C_Igual CI4(temp4,x1[3],y1[3]);
and AND3 (s,temp1,temp2,temp3,temp4);
endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg [3:0] x;
reg [3:0] y;
wire s; 
Prin modulo ( s, x, y);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0023 - Lucas Cardoso - 441694"); 
$display("Test AU's module"); 
x = 4'b0000; y = 4'b0000;  
// projetar testes do modulo 
$display("\na b s");
#1 $monitor("%b %b %b",x,y,s);
#1 x='b0001;y ='b0001;  
#1 x='b0010;y ='b0010;
#1 x='b0011;y ='b0011;

#1 x='b0100;y ='b0100; 
#1 x='b0101;y ='b0101; 
#1 x='b0110;y ='b1001;
#1 x='b0111;y ='b0111;

#1 x='b1000;y ='b1000; 
#1 x='b1001;y ='b1001;  
#1 x='b1010;y ='b1010;
#1 x='b1011;y ='b1011;

#1 x='b1100;y ='b1100; 
#1 x='b1101;y ='b1001;  
#1 x='b1110;y ='b1110;
#1 x='b1111;y ='b1001;

end 
endmodule // test_FullAdder