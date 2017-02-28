//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio07

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

module mem1x8 (output [0:7] out ,input addr, input rw,
input clk, input [0:7] in, input clear );

mem1x4 mem1x41 ( out[0:3], addr , rw, clk, in[0:3], clear );
mem1x4 mem1x42 ( out[4:7], addr , rw, clk, in[4:7], clear );

endmodule // mem1x8

module mem4x8 (output [0:7] out ,input [0:1]addr, input rw,
input clk, input [0:7] in, input clear );

wire [0:7] out1;
wire [0:7] out2;
wire [0:7] out3;
wire [0:7] out4;


wire s0 = 2'b 00;
wire s1 = 2'b 01;
wire s2 = 2'b 10;
wire s3 = 2'b 11;
reg tmp00,tmp01,tmp10,tmp11;

reg[0:7] asw;
initial begin
asw <= 8'b 00000000;
end

always @ ( clk )
begin
if ( addr == s0 )
begin
tmp00 <= 1;
tmp01 <= 0;
tmp10 <= 0;
tmp11 <= 0;
end
else
if ( addr == s1 )
begin
tmp00 <= 0;
tmp01 <= 1;
tmp10 <= 0;
tmp11 <= 0;
end
else
if ( addr == s2 )
begin
tmp00 <= 0;
tmp01 <= 0;
tmp10 <= 1;
tmp11 <= 0;
end
else
if ( addr == s3 )
begin
tmp00 <= 0;
tmp01 <= 0;
tmp10 <= 0;
tmp11 <= 1;
end
end

mem1x8 mem1x81 ( out1, tmp00 , rw, clk, in, clear  );
mem1x8 mem1x82 ( out2, tmp01 , rw, clk, in, clear  );
mem1x8 mem1x83 ( out3, tmp10 , rw, clk, in, clear  );
mem1x8 mem1x84 ( out4, tmp11 , rw, clk, in, clear  );

always @ ( clk )
begin
if ( addr == s0 )
begin
asw <= out1;
end
else
if ( addr == s1 )
begin
asw <= out2;
end
else
if ( addr == s2 )
begin
asw <= out3;
end
else
if ( addr == s3 )
begin
asw <= out4;
end
end

buf buf1 (out[0],asw[0]);
buf buf2 (out[1],asw[1]);
buf buf3 (out[2],asw[2]);
buf buf4 (out[3],asw[3]);
buf buf5 (out[4],asw[4]);
buf buf6 (out[5],asw[5]);
buf buf7 (out[6],asw[6]);
buf buf8 (out[7],asw[7]);




//mux2 mux22 ( out, out1, out2, out3, out4 ,addr );

endmodule // mem4x8

module mux2 ( output [0:7] out, input [0:7] out1,
input [0:7] out2,input [0:7] out3,
input [0:7] out4, input [0:1]addr  );

wire [0:7] tmp1;
wire [0:7] tmp2;
wire [0:7] tmp3;
wire [0:7] tmp4;

wire addr2;

not not1 ( addr3 , addr[0] );
not not1 ( addr4 , addr[1] );

and and01 ( tmp1[0] , out1[0],addr3,addr4 );
and and02 ( tmp1[1] , out1[1],addr3,addr4 );
and and03 ( tmp1[2] , out1[2],addr3,addr4 );
and and04 ( tmp1[3] , out1[3],addr3,addr4 );
and and05 ( tmp1[4] , out1[4],addr3,addr4 );
and and06 ( tmp1[5] , out1[5],addr3,addr4 );
and and07 ( tmp1[6] , out1[6],addr3,addr4 );
and and08 ( tmp1[7] , out1[7],addr3,addr4 );

and and09 ( tmp2[0] , out2[0],addr[1],addr3 );
and and10 ( tmp2[1] , out2[1],addr[1],addr3 );
and and11 ( tmp2[2] , out2[2],addr[1],addr3 );
and and12 ( tmp2[3] , out2[3],addr[1],addr3 );
and and13 ( tmp2[4] , out2[0],addr[1],addr3 );
and and14 ( tmp2[5] , out2[1],addr[1],addr3 );
and and15 ( tmp2[6] , out2[2],addr[1],addr3 );
and and16 ( tmp2[7] , out2[3],addr[1],addr3 );

and and17 ( tmp3[0] , out3[0],addr[0],addr4 );
and and18 ( tmp3[1] , out3[1],addr[0],addr4 );
and and19 ( tmp3[2] , out3[2],addr[0],addr4 );
and and20 ( tmp3[3] , out3[3],addr[0],addr4 );
and and21 ( tmp3[4] , out3[4],addr[0],addr4 );
and and22 ( tmp3[5] , out3[5],addr[0],addr4 );
and and23 ( tmp3[6] , out3[6],addr[0],addr4 );
and and24 ( tmp3[7] , out3[7],addr[0],addr4 );

and and25 ( tmp4[0] , out4[0],addr[0],addr[1] );
and and26 ( tmp4[1] , out4[1],addr[0],addr[1] );
and and27 ( tmp4[2] , out4[2],addr[0],addr[1] );
and and28 ( tmp4[3] , out4[3],addr[0],addr[1] );
and and29 ( tmp4[4] , out4[4],addr[0],addr[1] );
and and30 ( tmp4[5] , out4[5],addr[0],addr[1] );
and and31 ( tmp4[6] , out4[6],addr[0],addr[1] );
and and32 ( tmp4[7] , out4[7],addr[0],addr[1] );

or or1 ( out[0] , tmp1[0],tmp2[0], tmp3[0],tmp4[0] );
or or2 ( out[1] , tmp1[1],tmp2[1], tmp3[1],tmp4[1] );
or or3 ( out[2] , tmp1[2],tmp2[2], tmp3[2],tmp4[2] );
or or4 ( out[3] , tmp1[3],tmp2[3], tmp3[3],tmp4[3] );
or or5 ( out[4] , tmp1[4],tmp2[4], tmp3[4],tmp4[4] );
or or6 ( out[5] , tmp1[5],tmp2[5], tmp3[5],tmp4[5] );
or or7 ( out[6] , tmp1[6],tmp2[6], tmp3[6],tmp4[6] );
or or8 ( out[7] , tmp1[7],tmp2[7], tmp3[7],tmp4[7] );


endmodule  // mux2

module Exercicio07;


wire [0:7] out;
reg  [0:7] in;
reg rw,clk,clear;
reg [0:1] addr;


mem4x8 mem4x81 (out,addr,rw,clk,in,clear);

initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "clk   addr  rw   clear        in                 out" );
// initial values
clk = 1;
in = 8'b 10101111;
clear = 0;
addr = 2'b 00;
rw = 1;

#20 in = 8'b 11000011;
#20 addr = 2'b 01;
#30 in = 8'b 00001111;
#30 addr = 2'b 10;
#40 addr = 2'b 11;
#50 rw = 0;
#60 addr = 2'b 00;

#60 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%b      %b      %b      %b       %b       %b", clk,addr,rw,clear,in,out );
end 
endmodule // Exercicio07




