//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio04

module jkff ( output q, output qnot,
input j, input k, input clk,input clear, input preset );
reg q = 0, qnot = 1;
always
begin
#5 if ( clear )
begin
q <= 0; qnot <= 1;
end
else
if ( preset )
begin
q <= 1; qnot <= 0;
end
end
always @( posedge clk )
begin
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
else 
if ( ~clear )
begin
q <= 0; qnot <= 1;
end
else
if ( ~preset )
begin
q <= 1; qnot <= 0;
end
end
endmodule // jkff

module mem1x1 ( output out, input addr, input rw,
input clk, input in, input clear );

wire tmp1,q,qnot,notin;

and and1    ( tmp1, addr,clk,rw );
not not1    ( notin, in );
jkff jfkff1 (  q, qnot, in , notin, tmp1 , clear , 0 );
and and2    (  out, addr, q );

endmodule // mem1x1

module mem1x2 (output [0:1] out ,input addr, input rw,
input clk, input [0:1] in, input clear );

mem1x1 mem1x11 ( out[0], addr , rw, clk, in[0], clear );
mem1x1 mem1x12 ( out[1], addr , rw, clk, in[1], clear );

endmodule // mem1x2

module mem1x4 (output [0:3] out ,input addr, input rw,
input clk, input [0:3] in, input clear );

mem1x2 mem1x21 ( out[0:1], addr , rw, clk, in[0:1], clear );
mem1x2 mem1x22 ( out[2:3], addr , rw, clk, in[2:3], clear );

endmodule // mem1x4

module mem2x4 (output [0:3] out ,input addr, input rw,
input clk, input [0:3] in, input clear );

wire [0:3] out1;
wire [0:3] out2;
wire addr2;

not not1  ( addr2,addr);

mem1x4 mem1x41 ( out1, addr , rw, clk, in, clear  );
mem1x4 mem1x42 ( out2, addr2 , rw, clk, in, clear );

mux1 mux11 ( out, out1, out2, addr );


endmodule // mem2x4

module mux1 ( output [0:3] out, input [0:3] out1,
input [0:3] out2, input addr );

wire [0:3] tmp3;
wire [0:3] tmp4;
wire addr2;

not not1 ( addr2 , addr );

and and5 ( tmp3[0] , out2[0],addr2 );
and and6 ( tmp3[1] , out2[1],addr2 );
and and7 ( tmp3[2] , out2[2],addr2 );
and and8 ( tmp3[3] , out2[3],addr2 );

and and9  ( tmp4[0] , out1[0],addr );
and and10 ( tmp4[1] , out1[1],addr );
and and11 ( tmp4[2] , out1[2],addr );
and and12 ( tmp4[3] , out1[3],addr );

or or5 ( out[0] , tmp3[0],tmp4[0] );
or or6 ( out[1] , tmp3[1],tmp4[1] );
or or7 ( out[2] , tmp3[2],tmp4[2] );
or or8 ( out[3] , tmp3[3],tmp4[3] );



endmodule  // mux1

module mem2x8 (output [0:7] out ,input addr, input rw,
input clk, input [0:7] in, input clear );



mem2x4 mem2x41 ( out[0:3], addr , rw, clk, in[4:7], clear  );
mem2x4 mem2x42 ( out[4:7], addr , rw, clk, in[4:7], clear );



endmodule // mem2x8

module Exercicio04;


wire [0:7] out;
reg  [0:7] in;
reg addr,rw,clk,clear;

mem2x8 mem2x81 (out,addr,rw,clk,in,clear);

initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "clk   addr  rw   clear         in                    out" );
// initial values
clk = 1;
in = 8'b 10101010;
clear = 0;
addr = 0;
rw = 0;

#10 rw = 1;
#20 addr = 1;
#30 addr = 0;
#30 in = 8'b 11111111;
#30 rw = 0;
#35 addr = 1;
#40 clear = 1;
#40 addr = 0;
#50 clear = 0;
#50 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%b      %b      %b      %b       %b       %b", clk,addr,rw,clear,in,out );
end 
endmodule // Exercicio04




