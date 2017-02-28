// ------------------------------------
// -- João Henrique Mendes de Oliveira
// -- Matricula: 392734
// ------------------------------------

//constant definitions
`define found		1
`define notfound	0

//FSM by Mealy
module mealyEquals(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 3'b000,
		id0 = 3'b001,
		id00 = 3'b010,
		id000 = 3'b011,
		id1 = 3'b100,
		id11 = 3'b101,
		id111 = 3'b110;
		
		reg [1:0] E1;	//current state variables
		reg [1:0] E2;	//next state logic output
		
		//next state logic
		always @ (x or E1)
			begin
				y = `notfound;
				
				case (E1)
					start:
						if (x)
							E2 = id1;
						else
							E2 = id0;
					id0:
						if (x)
							E2 = start;
						else
							E2 = id00;
					id00:
						if (x)
							E2 = start;
						else
							E2 = id000;
					id000:
						if (x)
							begin
								E2 = start;
								y = `notfound;
							end
						else
							begin
								E2 = start;
								y = `found;
							end
					id1:
						if (x)
							E2 = id11;
						else
							E2 = start;
					id11:
						if (x)
							E2 = id111;
						else
							E2 = start;
					id111:
						if (x)
							begin
								E2 = start;
								y = `found;
							end
						else
							begin
								E2 = start;
								y = `notfound;
							end
					default:		//undefined state
						E2 = 2'bxx;
				endcase
			end //always at signal or state changing
			
		//state variables
			always @ (posedge clk or negedge reset)
				begin
					if (reset)
						E1 = E2;	//updates current state
					else
						E1 = start;	//reset
				end //always at signal changing
				
endmodule //mealyEquals

// -----------
//	Test Mealy
// -----------
module testMealyEquals;
	reg x,reset,clk;
	wire y;
	
	mealyEquals m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("MealyEquals\nNome: João Henrique\nMatricula: 392734");
		
		$display("Clk  Rst  x  y");
		#2 x = 1'b0;
		#8 x = 1'b1;
		#8 x = 1'b0;
		#6 $finish;
		end
		
	always
		#1 clk = ~clk;
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b  %b",$time,reset,x,y);
		end

endmodule //testMealy