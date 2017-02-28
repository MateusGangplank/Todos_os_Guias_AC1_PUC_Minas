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

