// ------------------------- 
// Exemplo0031 - F4 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output  s,
input  a, 
input  b,
input  p,
input  q);

and AND1(s,a,b,p,q);

endmodule//f4
module f5 (output  s1,
input  c, 
input  d,
input  r,
input  t);

or OR1(s1,c,d,r,t);

 endmodule // f5
module test_f4_f5; 
// ------------------------- definir dados 
reg x,y,z,w;  
wire g,h;
f4 modulo1 (g,x,y,z,w);
f5 modulo2 (h,x,y,z,w);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0; z = 'b0; w = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b %3b %3b %3b - AND = %3b - OR = %3b",x,y,z,w,g,h);
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