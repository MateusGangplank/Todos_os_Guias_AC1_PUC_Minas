`define found    1
`define notfound 0

module Exercicio01(y, x, clk, reset);
	output y;
	input x;
	input clk;
	input reset;
	reg y;
	parameter start = 2'b00, id0 = 2'b01, id01 = 2'b10;

	reg [1:0] E1;	// estado atual
	reg [1:0] E2;	// estado posterior

   always @(x or E1)	begin
		y = `notfound;
		case(E1)
			start: begin
				if(x)
					E2 = id0;
				else
					E2 = start;
			end
			id0: begin
				if(x)
					E2 = id0;
				else
					E2 = id01;
			end
			id01: begin
				if(x) begin
					E2 =  id0;
					y  = `found;
				end
				else begin
					E2 =  start;
					y = `notfound;
				end
			end
			default: begin
				E2 = 2'bxx;
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


module testeExercicio01;

	reg clk, reset, x;
	wire m;

	initial begin
		clk = 0;
		reset = 0;
		x = 0;
	end

	Exercicio01 MEALY(m, x, clk, reset);

	always
		#5 clk = ~clk;

	always @(posedge clk)
		$display ("%4d  %b    %b", $time, x, m);

	initial begin
		$display("Exercicio 01 - Douglas Borges - 417889\n");
		$display("Time  x  Seq 010");

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