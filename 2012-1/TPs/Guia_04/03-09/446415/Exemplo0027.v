// ------------------------- 
// Exemplo0023 - C_Igual_Dif 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// C_Igual_Dif_gate 
// -------------------------
module C_Igual (output s0,input a, input b);

wire n,m,o,w;

not NOT1 (n,a);
not NOT2 (m,b);
and AND1 (o,n,m);
and AND2 (w,a,b);
or OR1 (s0,o,w);

endmodule//C_Igual

module C_Dif (output s0,input a, input b);

wire n,m,o,w;

not NOT1 (n,a);
not NOT2 (m,b);
and AND1 (o,n,b);
and AND2 (w,a,m);
or OR1 (s0,o,w);

endmodule//C_Dif

module MUX (output d,input a,input b, input CH);

wire N1,h1,h0;

not NOT1(n1,CH);
and AND1(h0,a,N1);
and AND2(h1,b,CH);
or OR1 (d,h0,h1);

endmodule//MUX

module Prin (output s,input x1,input y1,input CH);

wire temp1,temp2;

C_Igual CI1(temp1,x1,y1);
C_Dif CD1(temp2,x1,y1);
MUX MUX1 (s,temp2,temp1,CH);

endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg  x;
reg  y;
reg ch; 
Prin modulo ( s, x, y,ch);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0027 - Filipe Viana de Miranda - 446415"); 
$display("Test AU's module"); 
x ='b0; y = 'b0;ch = 'b0;  
// projetar testes do modulo 
$display("\na b CH s");
#1 $monitor("%b %b %b %b",x,y,ch,s);
#1 x='b0;y ='b1;ch = 'b0;  
#1 x='b1;y ='b0;ch = 'b0;
#1 x='b1;y ='b1;ch = 'b0; 

#1 x='b0;y ='b0;ch = 'b1;
#1 x='b0;y ='b1;ch = 'b1;  
#1 x='b1;y ='b0;ch = 'b1;
#1 x='b1;y ='b1;ch = 'b1; 


end 
endmodule // test_C_Igual 