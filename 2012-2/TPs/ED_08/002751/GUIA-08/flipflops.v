//-------------------------------------
//--D, JK, SR, T flip-flops
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-------------------------------------

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

module tff(output q, output qnot, input t,
			  input clock);
	reg q, qnot;
	
	always @( posedge clock )
		begin 
			if(t)
				begin
					q <= t;
					qnot = ~qnot;
				end
			else
				begin
					q <= 0;
					qnot <= ~q;
				end
		end 
endmodule //tff

/*module test;
	reg d, preset, clear;
	wire clk, q, qnot;
	clock clk1(clk);
	dff2 flip1(q,qnot,d,clk,preset,clear);
	initial begin
		$display("\nt d q qnot");
		d = 0;
		preset = 0;
		clear = 1;
		#1 clear = 0;
		#1 preset = 1;
		#1 preset = 0;
		#22 d = 1;
		#10 d = 0;
		#10 d = 1;
		#20 d = 0;
		#20 $finish;
	end
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b",$time,d,q,qnot);
		end
endmodule*/