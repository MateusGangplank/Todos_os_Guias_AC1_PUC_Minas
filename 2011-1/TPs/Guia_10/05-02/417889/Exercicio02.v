`define found    1
`define notfound 0

module Exercicio02(y, x, clk, reset);
	output y;
	input x;
	input clk;
	input reset;
	reg y;
	parameter start = 3'b000, id0 = 3'b110, id01 = 3'b001, id011 = 3'b010, id0110 = 3'b101;

	reg [2:0] E1;	// estado atual
	reg [2:0] E2;	// estado posterior
	
	always @(x or E1) begin
		y = `notfound;

		case(E1)
			start: begin
				if(x)
					E2 = start;
				else
					E2 = id0;
			end
			id0: begin
				if(x)
					E2 = id01;
				else
					E2 = id0;
			end
			id01: begin
				if(x)
					E2 = start;
				else
					E2 = id011;
			end
			id011: begin
				if(x)
					E2 = id0110;
				else
					E2 = id0;
			end
			id0110: begin
				if(x)	begin
			 		E2 = start;
					y = `found;
				end
				else begin
					E2 = id0;
					y = `found;
				end
			end
			default: begin
				E2 = 3'bxxx;
			end
		endcase
	end

	always @(posedge clk or negedge reset) begin
		if (reset)
			E1 = E2;
		else
			E1 = 0;
	end

endmodule

module testeExercicio02;
	reg clk, reset, x;
	wire m;

	initial begin
		clk = 0;
		reset = 0;
		x = 0;
	end

 	Exercicio02 MOORE(m, x, clk, reset);

	always
		#5 clk = ~clk;

	always @(posedge clk)
		$display("%4d  %b    %b", $time, x, m);

	initial begin
		$display("Exercicio 02 - Douglas Borges - 417889\n");
		$display("Time  x  Seq 0110");

		#10 reset = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#5 $finish;
	end

endmodule 