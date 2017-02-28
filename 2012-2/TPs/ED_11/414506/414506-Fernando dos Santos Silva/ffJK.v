//----------------------------------------------------------
//-- Flip Flop JK
//----------------------------------------------------------

module ffJK(output q, output qnot, input j, input k,
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
	
		else if(j & ~k)
	
		begin
			q <= 1;
			qnot <= 0;
		end
	
		else if(~j & k)
	
		begin
			q <= 0;
			qnot <= 1;
		end
	
		else if(j & k)
	
		begin
			q <= ~q;
			qnot <= ~qnot;
		end
	end

endmodule //-- Fim flip flop JK