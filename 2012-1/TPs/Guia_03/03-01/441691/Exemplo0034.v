// ------------------------- 
// Exemplo0034 - F4 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module mux (output  s1,
input  x, 
input  y,
input  z,
input  w,
input [1:0]chave1);
wire t1,t2,t3,t4,n1,n2;

not NOT1(n1,chave1[0]);
not NOT2(n2,chave1[1]);
and AND1(t1,x,n1,n2);
and AND2(t2,y,chave1[0],n2);
and AND3(t3,z,n1,chave1[1]);
and AND4(t4,w,chave1[0],chave1[1]);
or OR1(s1,t1,t2,t3,t4);

endmodule//mux

module f4 (output  s2,
input  a, 
input  b,
input [1:0] chave2);
wire c,d,e,f;
or OR1(c,a,b);
xor XOR1(d,a,b);
nor NOR1(e,a,b);
xnor XNOR1(f,a,b);

mux MUX1(s2,c,e,d,f,chave2);

 endmodule // f4
module test_mux_f4; 
// ------------------------- definir dados 
reg x,y;
reg [1:0]z;  
wire g;
f4 modulo1 (g,x,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0; z = 'b00;
// projetar testes do modulo 
#1 $monitor("%3b %3b -Chave- %3b - s2 = %3b",x,y,z,g);
#1 x = 'b0; y = 'b1;z ='b00;
#1 x = 'b1; y = 'b0;z ='b00;
#1 x = 'b1; y = 'b1;z ='b00;

#1 x = 'b0; y = 'b0;z ='b01;
#1 x = 'b0; y = 'b1;z ='b01;
#1 x = 'b1; y = 'b0;z ='b01;
#1 x = 'b1; y = 'b1;z ='b01;

#1 x = 'b0; y = 'b0;z ='b10;
#1 x = 'b0; y = 'b1;z ='b10;
#1 x = 'b1; y = 'b0;z ='b10;
#1 x = 'b1; y = 'b1;z ='b10;

#1 x = 'b0; y = 'b0;z ='b11;
#1 x = 'b0; y = 'b1;z ='b11;
#1 x = 'b1; y = 'b0;z ='b11;
#1 x = 'b1; y = 'b1;z ='b11;

end 
endmodule // test_f4 