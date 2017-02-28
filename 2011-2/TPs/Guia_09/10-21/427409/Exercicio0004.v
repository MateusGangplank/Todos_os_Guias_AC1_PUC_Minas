//Guilherme Rodrigues Melo de Oliveira
//427409

module tff ( output q, output qnot,
  input    t, input    clk,
input    preset, input clear );
reg q, qnot;
initial
begin
q = 1'b1;
qnot = ~q;
end
always @( posedge clk )
begin
if ( clear )
  begin
   q <= 0;  qnot <= ~q;
  end
else
  if ( preset )
   begin
    q <= 1;  qnot <= ~q;
   end
  else
   begin
     if ( t )
      begin
       q <= ~q; qnot <= ~q;
      end
   end
end
endmodule // tff

module test;
reg   clk, clr, t, preset;
wire s0[3:0];
wire s0n[3:0];
wire y;
wire x;

nand NAND1(x, s0[0],~s0[1],s0[2] ,~s0[3]);
nand NAND2 (y,clr , x);
tff t1(s0[0],s0n[0],t,clk,,y);
tff t2(s0[1],s0n[1],t,~s0[0],,y);
tff t3(s0[2],s0n[2],t,~s0[1],,y);
tff t4(s0[3],s0n[3],t,~s0[2],,y);


initial
 begin
// initial values
     clk   = 0;
      clr = 0;
      t = 0;
      preset = 0;
 //input signal changing


  #5 $display("%4d %4b %4b %4b %4b",$time,s0[3],s0[1],s0[2],s0[0]);
clr = 1;
t =1;
 $monitor("%4d %4b %4b %4b %4b",$time,s0[3],s0[1],s0[2],s0[0]);
   #74$finish;
end // initial
always
  #4 clk = ~clk;


endmodule //