 // ------------------------- 
// Exercicio04 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// ------------------------- definir dados

module jkff ( output q, output qnot,input j, input k, input clk,input clear);
 
reg q, qnot; 
always @( posedge clk ) 
begin
if (clear)
begin 
q <= 0; qnot <= 1; 
end 
else 
if ( j & ~k ) 
begin 
q <= 1; qnot <= 0; 
end 
else 
if ( ~j & k ) 
begin 
q <= 0; qnot <= 1; 
end 
else 
if ( j & k ) 
begin 
q <= ~q; qnot <= ~qnot; 
end 
end 
endmodule // jkff

module mem (output s,input addr,input r,input clk,input x,input clear);

wire a1,nx,q,qnot,s;

and AND1 (a1,addr,r,clk);
not NOT1 (nx,x);
jkff JKFF1 (q,qnot,x,nx,a1,clear);
and AND2 (s,addr,q);

endmodule //1x1 

module mem1x4 (output [3:0] s,input addr,input r,input clk,input [3:0] x,input clear);


mem mem1x1 (s[0],addr,r,clk,x[0],clear);
mem mem1x1a (s[1],addr,r,clk,x[1],clear);
mem mem1x1b (s[2],addr,r,clk,x[2],clear);
mem mem1x1c (s[3],addr,r,clk,x[3],clear);

endmodule //mem1x4

module mux (output [7:0] d,input [7:0] x,input [7:0] y,input chave,input clk);

reg [7:0] d;
always @( posedge clk )
begin
if(chave)
begin
d = y;
end
else
begin
d = x;
end
end

endmodule //mux

module dmux (output f1,output f2,input chave,input x,input clk);

wire n1;
reg f1,f2;
always @( posedge clk )
begin
if(chave)
begin
f1 = 1; f2 = 0;
end
else
begin
f1 = 0; f2 = 1;
end
end

endmodule //mux

module mem8 (output [7:0] s,input addr,input r,input clk,input [7:0] x,input clear);

wire [7:0] s;

mem1x4 mem1x4 (s[7:4],addr,r,clk,x[7:4],clear);
mem1x4 mem1x4a (s[3:0],addr,r,clk,x[3:0],clear);

endmodule

module test_Memoria;

reg [7:0] x;
reg clk,clear,r,addr;
wire [7:0] s;
wire [7:0] q,w;
wire d1,d2;

dmux dmux1 (d1,d2,addr,1,clk);
mem8 m1(w,d1,r,clk,x,clear);
mem8 m2(q,d2,r,clk,x,clear);
mux mux1 (s,w,q,addr,clk);

initial
begin 
$display ( " Time     X      s      addr"); 
clk = 0; 
x = 0000; r = 1; clear = 1;
// input signal changing 
#3 x = 11010001; addr = 0;clear = 0;
#3 x = 11111000; addr = 1;
#3 addr = 0;r = 0;
#3 addr = 1; 
#3 $finish; 
end // initial 
always 
#1 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%5d %2b %4b %b", $time, x ,s,addr); 
end // always at positive edge clocking changing 
endmodule //module test