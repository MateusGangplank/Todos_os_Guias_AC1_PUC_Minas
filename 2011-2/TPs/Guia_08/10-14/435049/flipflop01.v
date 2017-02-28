// ------------------------- 
// fliflop.v  
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 

//-------------
//--Circuitos sequenciais - Flip-Flops 
//-------------

module fliflop ( s,not01,a,clk,preset,clear);

output s, not01;
input a, clk, preset, clear;

reg s, not01;

always @( posedge clk )
begin
 if ( clear == 1 )
  begin
   s <= 0; 	not01 <= 1;
  end
 else
  begin
 if ( preset == 1 )
  begin
   s <= 1; 	not01 <= 0;
  end
 else
  begin
   s <= a; 	not01 <= ~s;
  end
  end
end

endmodule //--fliflop


//-------------teste module
module test_flilop;

reg data;
reg clk;
reg preset, clear;
wire a01;
wire a02;
wire a03;
wire b;

fliflop flip01  (a01, b, b, clk, preset, clear );
fliflop flip02  (a02, b, c, clk, preset, clear );
fliflop flip03  (a03, b, d, clk, preset, clear );


initial begin
	$display("Flip-Flop - Lorena Danielle Gonçalves Bento - 435049");
	
	data = 1; clk = 1; preset = 0; clear = 1;
#1	$display("\n%b %b %b %b %b",a01 , a02, a03);
	data = 0; clk = 2; preset = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a01,a02,a03);
	data = 1; clk = 3;


end

endmodule // test_fliflop