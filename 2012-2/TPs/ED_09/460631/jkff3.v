//Wadson Ferreira
//460631

module jkff(output q, output qnot, input j, input k, input clk, input clear, input preset);
	reg q=0, qnot=1;
	always begin
		//verifica o clear em toda mudança do clock
		#5 if(clear) begin q=0; qnot=1; end
		   if(preset) begin q=1; qnot=0; end
	end
	always @( posedge clk ) begin
		if(~clear & ~preset) begin
			if ( j & ~k ) begin
				q <= 1; qnot <= 0;
			end else if ( ~j & k | clear) begin
				q <= 0; qnot <= 1;
			end else if ( j & k ) begin
				q <= ~q; qnot <= ~qnot;
			end
		end
	end
endmodule
