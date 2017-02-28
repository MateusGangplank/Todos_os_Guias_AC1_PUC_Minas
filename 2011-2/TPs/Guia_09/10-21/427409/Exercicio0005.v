// FAVOR COLOCAR NOME E MATRICULA AQUI

module jkff ( output q, output qnot,
input    j, input    k, input clk,input clear );
reg q, qnot;
initial
begin
q = 1'b0;
qnot = ~q;
end

always @( posedge clk )
begin
if ( clear )
  begin
   q <= 0;  qnot <= ~q;
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

module test;
reg   clk, clr, jk, preset,p,q;
wire s0[2:0];
wire s0n[2:0];
wire y;

nand NAND1 (y,p,q);

jkff jk0(s0[0],s0n[0],jk,jk,clk,y);
jkff jk1(s0[1],s0n[1],jk,jk,s0[0],y);
jkff jk2(s0[2],s0n[2],jk,jk,s0[1],y);


initial
 begin
// initial values
     clk   = 0;
      jk = 1;
      p = 1;
      q = 1;
 //input signal changing



 $monitor("%4d %4b %4b %4b",$time,s0n[2],s0n[0],s0n[1]);
   #74$finish;
end // initial
always
  #4 clk = ~clk;


endmodule //