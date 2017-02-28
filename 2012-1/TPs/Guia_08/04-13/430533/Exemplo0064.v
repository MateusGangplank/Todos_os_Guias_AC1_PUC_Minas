// Exemplo0064
// Aluno: Roger Rubens Machado
// Matricula: 430533 


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

module Exemplo0064;
reg clk;
reg data;

wire [3:0]s;
wire [3:0]q;

and a1(s[0], data);
and a1(s[1], data);
and a1(s[2], data);
and a1(s[3], data);

dff d1(q[0],,clk);
dff d2(q[1],q[0],clk);
dff d3(q[2],q[1],clk);
dff d4(q[3],q[2],clk);

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
endmodule // Exemplo0064