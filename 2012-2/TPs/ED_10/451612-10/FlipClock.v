/**
* Nome: Rodolfo Herman
* Matricula : 451612
* FLIP-FLOPS & CLOCK & MUX & DMUX - GUIA10
*
*/



module clock ( output clk );
//criar saida
reg clk;
//valor inicial do clock
initial begin
clk = 1'b0;
end
always begin
#6 clk = ~clk;
end
endmodule


module jkff ( output q, output qnot, input j, input k, input clk, input clear );
reg q, qnot;
always @( posedge clk or clear  )
begin
if ( clear )
begin
q <= 0; qnot <= 1;
end
else

if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // jkff

module dmx1bit(output s0, output s1,input a,input key);
	reg s0,s1;

	initial begin
		s0 = 0;
		s1 = 0;
	end
	always @(key or s0 or s1 or a)
		begin
			if(~key)
				begin
					s0 = a;
					s1 = 0;
				end
			else
				begin
					s0 = 0;
					s1 = a;
				end
		end
endmodule //dmx1

module dmx2bits( output s3, output s2, output s1, output s0, input x, input [1:0]key);
	reg s0, s1, s2, s3;
	initial begin
		s0 = 0;
		s1 = 0;
		s2 = 0;
		s3 = 0;
	end
	
	always @ (key or posedge x ) begin

                if   (key == 2'd0) begin
			s0 = 1;
		        s1 = 0;
		        s2 = 0;
		        s3 = 0;
                        end
                
                else if (key == 2'd1) begin
			s0 = 0;
		        s1 = 1;
		        s2 = 0;
		        s3 = 0;
                        end
                
                else if (key == 2'd2) begin
			s0 = 0;
		        s1 = 0;
		        s2 = 1;
		        s3 = 0;
                        end
                
                else if (key == 2'd3) begin
			s0 = 0;
		        s1 = 0;
		        s2 = 0;
		        s3 = 1;
		        end
	end

	always @(negedge x)
	begin
		s0 = 0;
		s1 = 0;
		s2 = 0;
		s3 = 0;
	end
endmodule //dmx2bits


module mux1bit(output [3:0]s, input [3:0]i0,input [3:0]i1, input key);
	
	reg [3:0]s;
	
	always @(key or i1 or i0)
	begin
		if(~key)
		begin
			s = i0;
		end
		else
		begin
			s = i1;
		end
	end
endmodule //--mux1


module mux1bit2( output [7:0]s, input [7:0]in3, input [7:0]in2, input [7:0]in1, input [7:0]in0, input [1:0]key);

	reg [7:0]s;
	
	always @( key or in0 or in1 or in2 or in3 )
	begin
                if   (key == 2'd0) begin
                        s = in0;
                        end
                
                else if (key == 2'd1) begin
                        s = in1;
                        end
                
                else if (key == 2'd2) begin
                        s = in2;
                        end
                
                else if (key == 2'd3) begin
                        s = in3;
		        end
	end
endmodule //mux1bit2



//--************************