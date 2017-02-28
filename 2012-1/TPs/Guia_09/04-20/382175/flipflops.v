//-------------------------------------
// Flip-Flops
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "clock.v"

module dff(output q, output qnot, input d, input clk);
	reg q, qnot;
	always @ (posedge clk)
		begin
			q <= d;
			qnot <= ~d;
		end
endmodule //dff

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

module srff(output q, output qnot,
				input s,input r, input clk);
	reg q, qnot;
	
	always @(posedge clk)
		begin
			if(s & ~r)
				begin
					q <= 1'b1;
					qnot <= 1'b0;
				end
			else if(~s & r)
				begin
					q <= 1'b0;
					qnot <= 1'b1;
				end
			else if(s & r)
				begin
					q <= 1'b0;
					qnot <= 1'b0;
				end
		end
endmodule //srff

module tff ( output q, output qnot, 
				input t, input clk, 
				input preset, input clear ); 
	reg q, qnot; 
	always @( posedge clk or posedge preset or posedge clear) 
	begin 
		if (clear ) 
		begin 
			q = 0; qnot = 1; 
		end 
		else if (preset) 
		begin 
			q = 1; qnot = 0; 
		end 
		else 
		begin 
			if ( t ) 
			begin 
				q <= ~q; qnot <= ~qnot; 
			end 
		end 
	end 
endmodule // tff 

module jkff ( output q, output qnot, 
	      input j, input k, input clk, input preset, input clear ); 
	reg q, qnot;
	always @(posedge clk or posedge preset or posedge clear)
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
		else if ( j & ~k ) 
		begin 
			q <= 1; qnot <= 0; 
		end 
		else if ( ~j & k ) 
		begin 
			q <= 0; qnot <= 1; 
		end 
		else if ( j & k ) 
		begin 
			q <= ~q; qnot <= ~qnot; 
		end
	end
endmodule // jkff 