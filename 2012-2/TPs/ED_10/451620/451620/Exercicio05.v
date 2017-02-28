//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio05

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





endmodule // mem4x8

module mem8x8 (output [0:7] out ,input [0:2]addr, input rw,
input clk, input [0:7] in, input clear );

wire [0:7] out1;
wire [0:7] out2;
wire [0:7] out3;
wire [0:7] out4;
wire [0:7] out5;
wire [0:7] out6;
wire [0:7] out7;
wire [0:7] out8;


wire s0 = 3'b 000;
wire s1 = 3'b 001;
wire s2 = 3'b 010;
wire s3 = 3'b 011;
wire s4 = 3'b 100;
wire s5 = 3'b 101;
wire s6 = 3'b 110;
wire s7 = 3'b 111;
reg tmp000,tmp001,tmp010,tmp011,tmp100,tmp101,tmp110,tmp111;

reg[0:7] asw;
initial begin
asw <= 8'b 00000000;
end

always @ ( clk )
begin
if ( addr == s0 )
begin
tmp000 <= 1;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s1 )
begin
tmp000 <= 0;
tmp001 <= 1;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s2 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 1;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s3 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 1;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s4 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 1;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s5 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 1;
tmp110 <= 0;
tmp111 <= 0;
end
else
if ( addr == s6 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 1;
tmp111 <= 0;
end
else
if ( addr == s7 )
begin
tmp000 <= 0;
tmp001 <= 0;
tmp010 <= 0;
tmp011 <= 0;
tmp100 <= 0;
tmp101 <= 0;
tmp110 <= 0;
tmp111 <= 1;
end
end

mem1x8 mem1x81 ( out1, tmp000 , rw, clk, in, clear  );
mem1x8 mem1x82 ( out2, tmp001 , rw, clk, in, clear  );
mem1x8 mem1x83 ( out3, tmp010 , rw, clk, in, clear  );
mem1x8 mem1x84 ( out4, tmp011 , rw, clk, in, clear  );
mem1x8 mem1x85 ( out5, tmp100 , rw, clk, in, clear  );
mem1x8 mem1x86 ( out6, tmp101 , rw, clk, in, clear  );
mem1x8 mem1x87 ( out7, tmp110 , rw, clk, in, clear  );
mem1x8 mem1x88 ( out8, tmp111 , rw, clk, in, clear  );

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
else
if ( addr == s4 )
begin
asw <= out5;
end
else
if ( addr == s5 )
begin
asw <= out6;
end
else
if ( addr == s6 )
begin
asw <= out7;
end
else
if ( addr == s7 )
begin
asw <= out8;
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





endmodule // mem8x8


module Exercicio05;


wire [0:7] out;
reg  [0:7] in;
reg rw,clk,clear;
reg [0:2] addr;


mem8x8 mem8x81 (out,addr,rw,clk,in,clear);

initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "clk   addr  rw   clear        in                 out" );
// initial values
clk = 1;
in = 8'b 10101111;
clear = 0;
addr = 3'b 000;
rw = 1;

#20 in = 8'b 11000011;
#20 addr = 3'b 001;
#30 in = 8'b 00001111;
#30 addr = 3'b 101;
#40 addr = 3'b 111;
#50 rw = 0;
#60 addr = 3'b 000;

#60 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%b      %b      %b      %b       %b       %b", clk,addr,rw,clear,in,out );
end 
endmodule // Exercicio05




