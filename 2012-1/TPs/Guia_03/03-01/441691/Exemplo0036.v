// ------------------------- 
// Exemplo0036 - F4 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output  s,
input  a, 
input  b,
input  c,
input  d);
wire x,y;

xnor XNOR1(x,a,b);
xnor XNOR2(y,c,d);
nand NAND1(s,x,y);

endmodule//f4
module test_f4; 
// ------------------------- definir dados 
reg x,y,z,w;
wire t;

f4 modulo1 (t,x,y,z,w);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0036 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0;z = 'b0;w = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b %3b %3b %3b - s = %3b",x,y,z,w,t);
#1 x = 'b0; y = 'b0;z ='b0;w ='b1;
#1 x = 'b0; y = 'b0;z ='b1;w ='b0;
#1 x = 'b0; y = 'b0;z ='b1;w ='b1;
#1 x = 'b0; y = 'b1;z ='b0;w ='b0;
#1 x = 'b0; y = 'b1;z ='b0;w ='b1;
#1 x = 'b0; y = 'b1;z ='b1;w ='b0;
#1 x = 'b0; y = 'b1;z ='b1;w ='b1;
#1 x = 'b1; y = 'b0;z ='b0;w ='b1;
#1 x = 'b1; y = 'b0;z ='b1;w ='b0;
#1 x = 'b1; y = 'b0;z ='b1;w ='b1;
#1 x = 'b1; y = 'b1;z ='b0;w ='b0;
#1 x = 'b1; y = 'b1;z ='b0;w ='b1;
#1 x = 'b1; y = 'b1;z ='b1;w ='b0;
#1 x = 'b1; y = 'b1;z ='b1;w ='b1;


end 
endmodule // test_f4 