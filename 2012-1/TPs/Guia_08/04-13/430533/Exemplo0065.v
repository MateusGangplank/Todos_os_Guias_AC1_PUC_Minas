// Exemplo0065
// Aluno: Roger Rubens Machado
// Matricula: 430533 


//--flip-flop

module dff(output q,input clr, input clk, input inp, input b); 
	reg q,
 	qnot;
	wire s;
	and AND1(s, inp, b);
  		always @( posedge clk )
   	begin
	   	if (clr)
		    q <= 0;
		   else
	 		 q <= s;
	  	qnot <= ~q;
      end

endmodule // dff

module Exemplo0065;
reg clk;
reg clr;
reg inp;
reg [3:0] data;
wire [3:0]q;
  
dff d1(q[0],clr,clk, inp, data[0]);
dff d2(q[1],clr,clk, inp, data[1]);
dff d3(q[2],clr,clk, inp, data[2]);
dff d4(q[3],clr,clk, inp, data[3]);

initial begin

// initial values 
clk = 1; 
clr = 0;
inp=1;data=3'b0000; 
// input signal changing 

#10 inp = 1; data=3'b0100; clr=0;
#10 inp = 0; data=3'b0010; clr=0;
#10 inp = 1; data=3'b0001; clr=0;
#20 inp = 0; data=3'b0111; clr=0;
#10 inp = 1; data=3'b1001; clr=0;
#10 inp = 1; data=3'b1111; clr=0;
#10 inp = 0; data=3'b0000; clr=1;
#10 inp = 1; data=3'b0000; clr=0;
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b   %b %b            %5b", $time, data, inp, clr, q); 
end 
endmodule // Exemplo0065