//--------------
//Rafael Lopes Barbosa
//435052
//---------------


//--flip-flop

module dff(output q,input d, input clk); 
	reg q,
 	qnot;
  		always @( posedge clk )
   	begin
	 		q <= d;
	  		qnot <= ~q;
end

endmodule // dff

module Exemplo0062;
reg clk;
reg data;

wire [4:0] q;

dff a1(q[4],data,clk);
dff a2(q[3],q[4],clk);
dff a3(q[2],q[3],clk);
dff a4(q[1],q[2],clk);
dff a5(q[0],q[1],clk);

initial begin

// initial values 
clk = 1; 
data = 0; 
// input signal changing 

#10 data = 1; 
#10 data = 0; 
#10 data = 1; 
#20 data = 0; 
#10 data = 1; 
#10 data = 1; 
#10 data = 0; 
#10 data = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %4b   %5b", $time, data, q ); 
end 
endmodule // Exemplo0062