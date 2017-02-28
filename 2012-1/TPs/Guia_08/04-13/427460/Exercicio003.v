// -------------------------
// Exercicio0003 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------
//--- Right Shift Register
//-----------------------

	module dff ( output q, 
		input d, input clk ); 
		reg q, qnot; 
	
	always @( posedge clk ) 
	
		begin  
		q <= d;
	   qnot <= ~q; 
	end 
endmodule // dff 


	module Exercicio003;
	reg clk;
	reg data;
	
	wire [3:0]q;
	
	dff a1(q[3], data, clk);
	dff a2(q[2], q[3], clk);
	dff a3(q[1], q[2], clk);
	dff a4(q[0], q[1], clk);
	
	
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
	$display ( "%4d %4b   %4b", $time, data, q ); 
end 
endmodule	
	