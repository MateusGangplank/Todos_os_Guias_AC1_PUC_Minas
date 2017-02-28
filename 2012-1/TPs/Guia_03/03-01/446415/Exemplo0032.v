// ------------------------- 
// Exemplo0032 - f4 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// f4_gate 
// -------------------------
module MUX (output s1,input e1,input e2,input c1);
  
wire temp1,temp2,notc1;

and AND2 (temp1,e1,c1);
not NOT1 (notc1,c1);
and AND3 (temp2,e2,notc1); 
or OR2 (s1,temp1,temp2);
endmodule//MUX

module Prin (output s,input a,input b,input CH);

wire e1,e2,c1;

and AND1 (e1,a,b);
or OR1 (e2,a,b);
MUX selec (s,e1,e2,CH);
endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg  x,y,v;
wire s,z; 
Prin modulo1 ( s, x, y, v);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Filipe Viana de Miranda - 446415"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0;v= 'b0; 
// projetar testes do modulo 
$display("\na b CH s");
#1 $monitor("%b %b %b %b",x,y,v,s);
#1 x='b0;y ='b1; v= 'b0;  
#1 x='b1;y ='b0; v= 'b0;
#1 x='b1;y ='b1; v= 'b0;

x = 'b0; y = 'b0;v= 'b1; 
#1 x='b0;y ='b1; v= 'b1;  
#1 x='b1;y ='b0; v= 'b1;
#1 x='b1;y ='b1; v= 'b1;
end 
endmodule // test_f4 