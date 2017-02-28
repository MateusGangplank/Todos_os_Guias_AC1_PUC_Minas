// -------------------------
// Exercicio0002 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------
//--- Left Shift Register
//-----------------------

	module dff ( output q, output qnot, 
		input d, input pre, input clr, input clk ); 
		reg q, qnot; 
	
	always @( posedge clk or posedge clr or  pre ) 
	
		begin 
		if (clr)
			begin
		 	q = 0;
			qnot = 1;
			end 
		else if(pre)
			begin
			q = 1;
			qnot = 0;
			end
		else 		
			begin
			q <= d;
	  	 	qnot = ~q; 
			end
	end 
endmodule // dff 


	module Exercicio002;
	reg clk;
	reg data;
	reg preset;
	reg clear;
	
	wire [3:0]q;
	wire [3:0]qnot;
		
	dff a1(q[0], qnot[0], data, preset, clear, clk);
	dff a2(q[1], qnot[1], q[0], preset, clear, clk);
	dff a3(q[2], qnot[2], q[1], preset, clear, clk);
	dff a4(q[3], qnot[3], q[2], preset, clear, clk);
	
	
	initial begin

// initial values 
	clk = 0; 
	data = 1;
	clear = 0;
	preset = 0;
	 

// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	#1 preset = 1;
	#1 preset = 0;
	#1 data = 1; 
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
	$display ( "%4d %4b  %4b", $time, data, q); 
end 
endmodule	
	