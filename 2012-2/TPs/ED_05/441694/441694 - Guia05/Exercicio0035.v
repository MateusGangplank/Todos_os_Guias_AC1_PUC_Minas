 // ------------------------- 
// Exemplo0035 - FullAdder 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// FullAdder
// ------------------------- 
module Comp (output s, 
input a,
input b, 
input c,
input d);
wire t1,t2,t3,not1,not2;
not NOT1 (not1,c);
not NOT2 (not2,d);
xnor XNOR1 (t1,a,c);
and AND1 (t2,not2,b);
and AND2 (t3,not1,a);
and AND3 (t4,t1,t2);
or OR2 (s,t3,t4);
endmodule//Comp

module testComp;
// ------------------------- definir dados 
reg x;
reg y;
reg w;
wire s;
reg z; 
Comp modulo ( s, x, y, w,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Lucas Cardoso - 441694"); 
$display("Test AU's module"); 
x = 'b0 ;z = 'b0; y = 'b0;w = 'b0; 
// projetar testes do modulo 
$display("\na b c d iguas");
#1 $monitor("%b %b %b %b %b",x,z,y,w,s);
#1 x='b0;z = 'b0;y ='b0;w = 'b1;   
#1 x='b0;z = 'b0;y ='b1;w = 'b0; 
#1 x='b0;z = 'b0;y ='b1;w = 'b1; 
#1 x='b0;z = 'b1;y ='b0;w = 'b0;  
#1 x='b0;z = 'b1;y ='b0;w = 'b1;   
#1 x='b0;z = 'b1;y ='b1;w = 'b0; 
#1 x='b0;z = 'b1;y ='b1;w = 'b1; 

#1 x='b1;z = 'b0;y ='b0;w = 'b0;  
#1 x='b1;z = 'b0;y ='b0;w = 'b1;   
#1 x='b1;z = 'b0;y ='b1;w = 'b0; 
#1 x='b1;z = 'b0;y ='b1;w = 'b1; 
#1 x='b1;z = 'b1;y ='b0;w = 'b0; 
#1 x='b1;z = 'b1;y ='b0;w = 'b1;  
#1 x='b1;z = 'b1;y ='b1;w = 'b0;
#1 x='b1;z = 'b1;y ='b1;w = 'b1;

end 
endmodule // test