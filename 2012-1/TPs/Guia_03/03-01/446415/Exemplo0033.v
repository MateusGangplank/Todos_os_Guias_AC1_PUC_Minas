// ------------------------- 
// Exemplo0033 - f4 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// f4_gate 
// -------------------------
module MUX (output s1,output s2,input e1,input e2,input e3,
input e4,input c1);
  
wire temp1,temp2,temp3,temp4,notc1;

and AND1 (temp1,e1,c1);
not NOT1 (notc1,c1);
and AND2 (temp2,e2,notc1); 
or OR1 (s1,temp1,temp2);

and AND2 (temp3,e3,c1);
not NOT1 (notc1,c1);
and AND2 (temp4,e4,notc1); 
or OR2 (s2,temp3,temp4);

endmodule//MUX

module Prin (output s,output s0,input a,input b,input CH);

wire e1,e2,e3,e4,c1;

nand NAND1 (e1,a,b);
and AND3 (e2,a,b);
nor NOR1 (e3,a,b);
or OR3 (e4,a,b);
MUX selec (s,s0,e1,e2,e3,e4,CH);
endmodule//Prin

module testPrin;
// ------------------------- definir dados 
reg  x,y,v;
wire s,z; 
Prin modulo1 ( s,z, x, y, v);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Filipe Viana de Miranda - 446415"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0;v= 'b0; 
// projetar testes do modulo 
$display("\na b CH s1 s2");
#1 $monitor("%b %b %b %b %b",x,y,v,s,z);
#1 x='b0;y ='b1; v= 'b0;  
#1 x='b1;y ='b0; v= 'b0;
#1 x='b1;y ='b1; v= 'b0;

x = 'b0; y = 'b0;v= 'b1; 
#1 x='b0;y ='b1; v= 'b1;  
#1 x='b1;y ='b0; v= 'b1;
#1 x='b1;y ='b1; v= 'b1;
end 
endmodule // test_f4 