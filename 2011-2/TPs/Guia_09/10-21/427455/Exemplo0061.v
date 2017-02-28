module tff ( output q, output qnot,
  input    t, input    clk, 
  input    preset, input clear ); 
 
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


module Exemplo0060; 
reg pulse;
reg clear;
reg preset;
wire[3:0] x;
reg t;
wire[3:0] y;
tff t0(x[0],,t,pulse,preset,clear); 
tff t1(x[1],,t,~(x[0]),preset,clear); 
tff t2(x[2],,t,~(x[1]),preset,clear); 
tff t3(x[3],,t,~(x[2]),preset,clear); 
  initial
  begin 
// initial values 
      
	preset = 1;
	pulse = 0;
	clear = 0;
	t = 0; 
 
// input signal changing		
	#5 $display ("%4b  Pulse: %1b " , x , pulse);
	preset = 1; clear = 1; t = 1;
	$monitor ("%4b  Pulse: %1b " , x , pulse);
   #120 $finish; 
 end // initial 
 
 always
 	#4 pulse = ~pulse;

   
 
endmodule // Exemplo0051