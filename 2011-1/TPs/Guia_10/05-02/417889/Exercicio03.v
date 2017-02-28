`define found    1
`define notfound 0

module Exercicio03(y, x, clk, reset);
	output y;
	input x;
	input clk;
	input reset;
	reg y;
	parameter start = 3'b000, id1 = 3'b001, id10 = 3'b010, id101 = 3'b100;

	reg [2:0] E1;	// estado atual
	reg [2:0] E2;	// estado posterior

   always @(x or E1) begin
		y = `notfound;

		case(E1)
			start: begin
				if(x)
					E2 = id1;
				else
					E2 = start;
			end
			id1: begin
				if(x)
					E2 = id1;
				else
					E2 = id10;
			end
			id10: begin
				if(x)
					E2 = id1;
				else
					E2 = id101;
			end
			id101: begin
				if(x) begin
					E2 =  id1;
					y = `found;
				end
				else begin
					E2 = start;
					y = `notfound;
				end
			end
			default: begin
				E2 = 3'bxxx;
			end
		endcase
	end

	always @(posedge clk or negedge reset) begin
		if(reset)
			E1 = E2;
		else
			E1 = 0;
	end

endmodule

module testeExercicio03;
	reg clk, reset, x;
	wire m;

	initial begin
		clk = 0;
		reset = 0;
		x = 0;
	end

	Exercicio03 MEALY(m, x, clk, reset);

	always
		#5 clk = ~clk;

	always @(posedge clk)
		$display ("%4d  %b    %b", $time, x, m);

	initial begin
		$display("Exercicio 03 - Douglas Borges - 417889\n");
		$display("Time  x  Seq 1010");

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