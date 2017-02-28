/**---------------------------------------
 * AC I - Ciencia da Computacao - PUC MINAS
 * Roger Rubens Machado - 430533
 */

/*
* Flip Flop DFF
*/
module dff ( output q, output qnot, input   d, input clk );
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    q <= d;  qnot <= ~q;
end 
 
endmodule // dff 

/*
* Flip Flop TFF
*/
module tff ( output q, output qnot,  input    t, input    clk,   input    preset, input clear );
 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
 if ( ~clear ) 
  begin 
   q <= 0;   qnot <= ~q; 
  end 
 else 
  if ( ~preset )
   begin 
    q <= 1;   qnot <= ~q; 
   end 
  else 
   begin 
     if ( t ) 
      begin 
       q <= ~q;  qnot <= ~q; 
      end 
   end 
end 
 
endmodule // tff

/*
* Flip Flop SRFF
*/
 module srff ( output q, output qnot,
 input    s, input r, input clk ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    if ( s & ~r ) 
     begin 
      q <= 1;   qnot <= 0; 
     end 
    else 
      if ( ~s & r ) 
       begin 
        q <= 0;   qnot <= 1; 
       end 
      else 
        if ( s & r ) 
         begin 
          q <= 0;   qnot <= 0; // arbitrary 
         end 
end 
 
endmodule // srff 

/*
* Flip Flop JKFF
*/
module jkff ( output q, output qnot, input    j, input    k, input clk ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    if ( j & ~k ) 
     begin 
      q <= 1;   qnot <= 0; 
     end 
    else 
      if ( ~j & k ) 
       begin 
        q <= 0;   qnot <= 1; 
       end 
      else 
        if ( j & k ) 
         begin 
          q <= ~q;   qnot <= ~qnot; 
         end 
end 
 
endmodule // jkff