// ------------------------- 
// Exemplo0035 - F4 
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
input  a, 
input  b,
input  c,
input  d,
input [2:0]chave1);
wire t1,t2,t3,t4,t5,t6,t7,t8,n1,n2,n3;

not NOT1(n1,chave1[0]);
not NOT2(n2,chave1[1]);
not NOT3(n3,chave1[2]);
and AND1(t1,x,n1,n2,n3);
and AND2(t2,y,n1,n2,chave1[2]);
and AND3(t3,z,n1,chave1[1],n3);
and AND4(t4,w,n1,chave1[1],chave1[2]);
and AND5(t5,a,chave1[0],n2,n3);
and AND6(t6,b,chave1[0],n2,chave1[2]);
and AND7(t7,c,chave1[0],chave1[1],n3);
and AND8(t8,d,chave1[0],chave1[1],chave1[2]);
or OR1(s1,t1,t2,t3,t4,t5,t6,t7,t8);

endmodule//mux

module f4 (output  s2,
input  a, 
input  b,
input [2:0] chave2);
wire e,f,g,h,i,j,k,l;
or OR1(e,a,b);
xor XOR1(f,a,b);
nor NOR1(g,a,b);
xnor XNOR1(h,a,b);
and AND1(i,a,b);
nand NAND1(j,a,b);
not NOT1(k,a);
not NOT2(l,b);

mux MUX1(s2,e,f,g,h,i,j,k,l,chave2);

 endmodule // f4
module test_mux_f4; 
// ------------------------- definir dados 
reg x,y;
reg [2:0]z;  
wire g;
f4 modulo1 (g,x,y,z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0; z = 'b000;
// projetar testes do modulo 
#1 $monitor("%3b %3b -Chave- %3b - s2 = %3b",x,y,z,g);
#1 x = 'b0; y = 'b1;z ='b000;
#1 x = 'b1; y = 'b0;z ='b000;
#1 x = 'b1; y = 'b1;z ='b000;

#1 x = 'b0; y = 'b0;z ='b001;
#1 x = 'b0; y = 'b1;z ='b001;
#1 x = 'b1; y = 'b0;z ='b001;
#1 x = 'b1; y = 'b1;z ='b001;

#1 x = 'b0; y = 'b0;z ='b010;
#1 x = 'b0; y = 'b1;z ='b010;
#1 x = 'b1; y = 'b0;z ='b010;
#1 x = 'b1; y = 'b1;z ='b010;

#1 x = 'b0; y = 'b0;z ='b011;
#1 x = 'b0; y = 'b1;z ='b011;
#1 x = 'b1; y = 'b0;z ='b011;
#1 x = 'b1; y = 'b1;z ='b011;

#1 x = 'b0; y = 'b0;z ='b100;
#1 x = 'b0; y = 'b1;z ='b100;
#1 x = 'b1; y = 'b0;z ='b100;
#1 x = 'b1; y = 'b1;z ='b100;

#1 x = 'b0; y = 'b0;z ='b101;
#1 x = 'b0; y = 'b1;z ='b101;
#1 x = 'b1; y = 'b0;z ='b101;
#1 x = 'b1; y = 'b1;z ='b101;

#1 x = 'b0; y = 'b0;z ='b110;
#1 x = 'b0; y = 'b1;z ='b110;
#1 x = 'b1; y = 'b0;z ='b110;
#1 x = 'b1; y = 'b1;z ='b110;

#1 x = 'b0; y = 'b0;z ='b111;
#1 x = 'b0; y = 'b1;z ='b111;
#1 x = 'b1; y = 'b0;z ='b111;
#1 x = 'b1; y = 'b1;z ='b111;

end 
endmodule // test_f4 