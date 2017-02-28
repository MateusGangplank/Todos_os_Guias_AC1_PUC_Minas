// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// --------------------------- 
// -- Flip-Flop D
// --------------------------- 
 
module dff ( output q, output qnot, input d, input clk ); 
	reg q, qnot; 
	
 	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	always @( posedge clk ) 
	begin 
 	   q <= d;  qnot <= ~d; 
	end 
endmodule // dff 

module dff2(output q, output qnot, input d,
			input clk, input preset, input clear);
	reg q, qnot;
	
	always @(posedge clk or posedge clear or posedge preset)
		begin
			if(clear)
				begin
					q = 0;
					qnot = 1;
				end
			else if(preset)
				begin
					q = 1;
					qnot = 0;
				end
			else if(d)
				begin
					q <= 1;
					qnot <= 0;
				end
			else
				begin
					q <= 0;
					qnot <= 1;
				end
		end
endmodule //dff2