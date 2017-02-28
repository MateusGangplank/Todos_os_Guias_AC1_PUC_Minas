//Wadson Ferreira
//460631

module tff ( output q, output qnot, input t, input clk, input preset, input clear );
	reg q=0, qnot=1;
	always @( posedge clk ) begin
		if ( ~clear ) begin
			q <= 0; qnot <= 1;
		end else if ( ~preset ) begin
			q <= 1; qnot <= 0;
		end else begin
			if ( t ) begin
				q <= ~q; qnot <= ~qnot;
			end
		end
	end
	always #5 if (~clear) begin q<=0; qnot<=1; end
endmodule

