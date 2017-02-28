// ------------------------- 
// fliflop04.v  
// Nome: André Henriques Fernandes
// Matricula: 427386
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
 s <= a; 	not01 <= ~s;
end

endmodule 



module Or (output s,input a, input b);
reg s;

always @( a or b )
begin
  if ( a )
   begin
    s <= a;
   end
  else
   begin
    if ( b )
     begin
      s <= b;
     end
    else
     begin
      s <= 0;
     end
   end
end
endmodule // Or

module test_fliflop03;

reg data;
reg clk;
wire a;
wire b;
wire c;
wire d;
wire e;
wire x;
wire s;

or or01  (s, data, a);

initial begin
	$display("Flip-Flop - Andre Henriques - 427386");
	data = 0; clk = 1;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 1; clk = 2;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 3;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 4;
end 

endmodule // flipflop 
