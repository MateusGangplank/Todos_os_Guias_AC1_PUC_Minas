// ------------------------- 
// Exemplo0032 - F4 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module mux (output  s,
input  x, 
input  y,
input chave);
wire t,u,v;

and AND1(t,x,chave);
not NOT1(u,chave);
and AND2(v,y,u);
or OR1(s,t,v);

endmodule//mux

module f4 (output  s1,
input  a, 
input  b,
input  chave2);
wire c,d;

and AND3(c,a,b);
or OR1(d,a,b);
mux MUX1(s1,c,d,chave2);

 endmodule // f4
module test_mux_f4; 
// ------------------------- definir dados 
reg x,y,z;  
wire g;
f4 modulo1 (g,x,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0; z = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b %3b -Chave- %3b - s = %3b",x,y,z,g);
#1 x = 'b0; y = 'b0;z ='b1;
#1 x = 'b0; y = 'b1;z ='b0;
#1 x = 'b0; y = 'b1;z ='b1;
#1 x = 'b1; y = 'b0;z ='b0;
#1 x = 'b1; y = 'b0;z ='b1;
#1 x = 'b1; y = 'b1;z ='b0;
#1 x = 'b1; y = 'b1;z ='b1;
end 
endmodule // test_f4 