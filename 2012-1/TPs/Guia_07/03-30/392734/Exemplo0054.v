// ------------------------------------
// -- João Henrique Mendes de Oliveira
// -- Matricula: 392734
// ------------------------------------

//constant definitions
`define found		1
`define notfound	0

//FSM by Mealy
module mealy0111(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 2'b00,
		id0 = 2'b01,
		id01 = 2'b11,
		id011 = 2'b10;
		
		reg [1:0] E1;	//current state variables
		reg [1:0] E2;	//next state logic output
		
		//next state logic
		always @ (x or E1)
			begin
				y = `notfound;
				
				case (E1)
					start:
						if (x)
							E2 = start;
						else
							E2 = id0;
					id0:
						if (x)
							E2 = id01;
						else
							E2 = id0;
					id01:
						if (x)
							E2 = id011;
						else
							E2 = id0;
					id011:
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
				
endmodule //mealy0111

// -----------
//	Test Mealy
// -----------
module testMealy0111;
	reg x,reset,clk;
	wire y;
	
	mealy0111 m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("Mealy0111\nNome: João Henrique\nMatricula: 392734");
		
		$display("Clk  Rst  x  y");
		#2 x = 1'b0;
		#2 x = 1'b1;
		#6 $finish;
		end
		
	always
		#1 clk = ~clk;
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b  %b",$time,reset,x,y);
		end

endmodule //testMealy