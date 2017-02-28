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
   q <= 0;   qnot <= ~q;
  end 
 else 
  if ( preset )
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


module Exemplo0062;
reg pulse;
reg clear;
reg preset;
wire[3:0] q;
wire[3:0] qnot;
reg t;
wire y;
wire w;
wire k;  
and AND1 (y, q[0], ~q[1], q[2], ~q[3]);
or  OR1  (w, y, ~t);
tff t0(q[0],qnot[0],t,pulse,w,clear);
tff t1(q[1],qnot[1],t,(q[0]),w,clear);
tff t2(q[2],qnot[2],t,(q[1]),w,clear);
tff t3(q[3],qnot[3],t,(q[2]),w,clear);

  initial
  begin 
// initial values 


	pulse = 0;
	clear = 0;
	t = 0;

// input signal changing
	#5 $display ("%4b  Pulse: %1b t=%d" , q , pulse, $time );
	clear = 0;
	#5 $display ("%4b  Pulse: %1b t=%d" , q , pulse, $time );
	t=1;
	$monitor ("%4b  Pulse: %1b t=%d" , q , pulse, $time );


   #78 $finish;
 end // initial
 
 always
 	#4 pulse = ~pulse;

   
 
endmodule // Exemplo0051