// -------------------------------------------------
// -- FLIP FLOP D, com prset e clear
// -------------------------------------------------
module dff (q, qnot, d, clk, preset, clear);
	output 	q; 
	output 	qnot; 
	input 	d; 
	input 	clk; 
	input 	preset;
	input   clear; 
	
	reg q, qnot;
	
	always @( posedge clk or posedge preset or posedge clear) 
		begin
		if(clear)
			begin
			q 		<= 0;
			qnot 	<= 1;	
			end
		else if(preset)
			begin
			q 		<= 1;
			qnot 	<= 0;
			end
		else if(d)
			begin
			q 		<= 1; 
			qnot 	<= 0; 
			end
		else
			begin
			q 		<= 0;
			qnot 	<= 1;
			end
		end
endmodule // -- dff 

// -------------------------------------------------
// -- FLIP FLOP D
// -------------------------------------------------

module dff2(output q, output qnot, input d, input clk);
	reg q, qnot;
	always @ (posedge clk)
		begin
			q <= d;
			qnot <= ~d;
		end
endmodule //dff