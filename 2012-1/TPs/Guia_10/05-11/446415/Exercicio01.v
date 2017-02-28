//-- Aluno: Filipe Viana de Miranda - 446415
//-- Exercicio01 ED10

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

module test_Memoria;

reg [3:0] x;
reg clk,clear,r,addr;
wire [3:0] s;

mem mem1x1 (s[0],addr,r,clk,x[0],clear);
mem mem1x1a (s[1],addr,r,clk,x[1],clear);
mem mem1x1b (s[2],addr,r,clk,x[2],clear);
mem mem1x1c (s[3],addr,r,clk,x[3],clear);


initial
begin 
$display ( "Aluno: Filipe Viana de Miranda - 446415" );
$display ( " Time X s "); 
clk = 0; 
x = 0; r = 1; clear = 1;
// input signal changing 
#3 x = 1001; addr = 1;clear = 0;
#2 x = 0; addr = 1; 
#3 addr = 1; 
#3 $finish; 
end // initial 
always 
#1 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%5d %2b %4b", $time, x ,s); 
end // always at positive edge clocking changing 
endmodule //module test