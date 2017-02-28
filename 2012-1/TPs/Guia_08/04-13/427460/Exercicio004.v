// -------------------------
// Exercicio0004 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------
//--- Left Rotate Register
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


	module Exercicio004;
	reg clk;
	reg inp;
	
	
	wire [3:0]q;
	wire s;
	
	or or1(s, q[0], inp);	
	dff a1(q[1], s, clk);
	dff a2(q[2], q[1], clk);
	dff a3(q[3], q[2], clk);
	
	
	
	initial begin

// initial values 
	clk = 1; 
	inp = 0; 

// input signal changing 
	#10 inp = 1; 
	#10 inp = 0; 
	#10 inp = 1; 
	#20 inp = 0; 
	#10 inp = 1; 
	#10 inp = 1; 
	#10 inp = 0; 
	#10 inp = 1;  
	#30 $finish; 
	
	end // initial 
	always 
		#5 clk = ~clk; 
	always @( posedge clk ) 

begin 
	$display ( "%4d %4b   %4b", $time, inp, q ); 
end 
endmodule	
	