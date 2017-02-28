// ------------------------- 
// Exemplo0033 - F4 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module mux (output  s1, output s2,
input  x, 
input  y,
input  z,
input  w,
input chave1);
wire t1,t2,t3,t4,n1,n2;

and AND1(t1,x,chave1);
not NOT1(n1,chave1);
and AND2(t2,y,n1);
and AND3(t3,z,chave1);
not NOT2(n2,chave1);
and AND4(t4,w,n2);
or OR1(s1,t1,t2);
or OR2(s2,t3,t4);

endmodule//mux

module f4 (output  s3, output s4,
input  a, 
input  b,
input  chave2);
wire c,d,e,f;
nor NOR1(c,a,b);
or OR1(d,a,b);
nand NAN1(e,a,b);
and AND1(f,a,b);
mux MUX1(s3,s4,c,d,e,f,chave2);

 endmodule // f4
module test_mux_f4; 
// ------------------------- definir dados 
reg x,y,z;  
wire g,h;
f4 modulo1 (g,h,x,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0; z = 'b0;
// projetar testes do modulo 
#1 $monitor("%3b %3b -Chave- %3b - s3 = %3b  s4 = %3b",x,y,z,g,h);
#1 x = 'b0; y = 'b0;z ='b1;
#1 x = 'b0; y = 'b1;z ='b0;
#1 x = 'b0; y = 'b1;z ='b1;
#1 x = 'b1; y = 'b0;z ='b0;
#1 x = 'b1; y = 'b0;z ='b1;
#1 x = 'b1; y = 'b1;z ='b0;
#1 x = 'b1; y = 'b1;z ='b1;
end 
endmodule // test_f4 