// Exemplo0060
// Aluno: Jonatas Sena Ferreira
// Matricula: 427424

//-------------
//--- flip-flop
//-------------

module dff(output q,input d, input clk); 
	reg q,
 	qnot;
  		always @( posedge clk )
   	begin
	 		q <= d;
	  		qnot <= ~q;
end

endmodule // dff

module Exemplo0060;
reg clk;
reg data;

wire s;
wire [4:0]q;


dff a1(q[0],s,clk);
dff a2(q[1],q[0],clk);
dff a3(q[2],q[1],clk);
dff a4(q[3],q[2],clk);
dff a5(q[4],q[3],clk);

or (s, data, q[4]);

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

endmodule // Exemplo0060 