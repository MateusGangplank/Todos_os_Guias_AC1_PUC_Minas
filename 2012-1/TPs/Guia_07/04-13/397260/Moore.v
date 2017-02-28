// ------------------------------------
// -- Pedro Henrique Hardeman Guedes
// -- Matricula: 397260
// ------------------------------------

//constant definitions
`define found		1
`define notfound	0

//FSM by Mealy
module mealy101(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 2'b00,
		id1 = 2'b01,
		id10 = 2'b11;
		
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
							E2 = start;
					id1:
						if (x)
							E2 = id1;
						else
							E2 = id10;
					id10:
						if (x)
							begin
								E2 = id1;
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
				
endmodule //mealy101

// -----------
//	Test Mealy
// -----------
module testMealy101;
	reg x,reset,clk;
	wire y;
	
	mealy101 m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("Mealy101\nNome: Fernando Silva\nMatricula: 414506");
		
		$display("Clk  Rst  x  y");
		#2 x = 1'b0;
		#2 x = 1'b1;
		#4 $finish;
		end
		
	always
		#1 clk = ~clk;
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b  %b",$time,reset,x,y);
		end

endmodule //testMealy