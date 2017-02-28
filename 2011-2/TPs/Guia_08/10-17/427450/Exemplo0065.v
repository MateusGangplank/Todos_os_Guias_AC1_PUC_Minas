//--------------
// Exemplo 0064
// Aluno: Patrick Flávio Teixeira Coura
// Matrícula: 427450
//---------------


//--flip-flop

module dff(output q,input clr, input clk, input inp, input b, input a); 
	reg q, qnot;
	wire s;
	and AND1(s, inp, b);
	always @( posedge clk )
  	begin
	if (clr)
		q <= 0;
	else if (inp)
		q <= b;
	else
	  	q <= a;
	
	qnot <= ~q;
   end
	endmodule // dff

module Exemplo0064;
reg clk;
reg clr;
reg inp;
reg [4:0] data;
wire [4:0]q;

dff d1(q[0],clr,clk, inp, data[0], 0);
dff d2(q[1],clr,clk, inp, data[1], q[0]);
dff d3(q[2],clr,clk, inp, data[2], q[1]);
dff d4(q[3],clr,clk, inp, data[3], q[2]);
dff d5(q[4],clr,clk, inp, data[4], q[3]);

initial begin

// initial values 
clk = 1; 
clr = 0;
inp=1;data=4'b0000; 
// input signal changing 

#10 inp = 1; data=5'b00100; clr=0;
#10 inp = 0; data=5'b00010; clr=0;
#10 inp = 0; data=5'b00001; clr=0;
#20 inp = 0; data=5'b00111; clr=0;
#10 inp = 0; data=5'b01001; clr=0;
#10 inp = 0; data=5'b01111; clr=0;
#10 inp = 0; data=5'b00000; clr=0;
#10 inp = 0; data=5'b00000; clr=0;
#30 $finish; 
end // initial 

always 
#5 clk = ~clk; 

always @( posedge clk ) 

	begin 
		$display ( "%4d %b   %b %b            %5b", $time, data, inp, clr, q); 
	end 
endmodule // Exemplo0064