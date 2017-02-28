module dff ( output q, output qnot,  
input   d, input clk ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    q <= d;  qnot <= ~q; 
end 
 
endmodule // dff

module RotateLeft(output[0:4] x,input clk, input inp);
wire data;
or o1(data,x[0], inp);
dff d4(x[4],,data,clk);
dff d3(x[3],,x[4],clk);
dff d2(x[2],,x[3],clk);
dff d1(x[1],,x[2],clk);
dff d0(x[0],,x[1],clk);
endmodule

module Exemplo0058; 
 reg  d;
 wire[4:0] i; 
 reg clk;
 RotateLeft sL(i,clk,d);
 initial 
  begin 
// initial values 
       clk    = 1;        
       d       = 1;
		 
 
// input signal changing 
 
  $display ( "%5b", i );
  #6 d = 0;
  $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );
  #10 $display ( "%5b", i );	
  #55 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 

   
 
endmodule // Exemplo0051