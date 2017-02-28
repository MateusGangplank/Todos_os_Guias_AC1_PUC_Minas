//-------------------
//--- Moore 1001 FSM
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
//-------------------

`include "clock.v"


/*
					  _____________________________
					 /										 \
					/										  \
				  /											\
			1	 v		0			0				1		  1|
[start]--->[id1]--->[id10]--->[id100]--->[id1001]//found
  ^ \0		^ \1			1|			  1|			  0|
  \_/			\_/			 /				/				/
  	\			 \				/			  /			  /
	 \			  \________/			 /				 /
	  \			\						/				/
	   \			 \_______________/			  /
		 \												 /
		  \_________________________________/


*/

module moore1001(y,x,clk,reset);
	output y;
	input x,clk,reset;
	reg y;
	
	parameter
		start = 3'b000,
		id1 = 3'b001,
		id10 = 3'b010,
		id100 = 3'b011,
		id1001 = 3'b100;
	
	reg[2:0]E1;
	reg[2:0]E2;
	
	always @ (x or E1)
		begin
			case(E1)
				start:
					if(x)
						E2 = id1;
					else
						E2 = start;
				id1:
					if(x)
						E2 = id1;
					else
						E2 = id10;
				id10:
					if(x)
						E2 = id1;
					else
						E2 = id100;
				id100:
					if(x)
						E2 = id1001;
					else
						E2 = start;
				id1001:
						if(x)
							E2 = id1;
						else
							E2 = start;
				default:
					E2 = 3'bxxx;
			endcase
		end //always at state or signal changing
		
		always @(posedge clk or negedge reset)
			begin
				if(reset)
					E1 = E2;
				else
					E1 = 0;
			end
		
		always @ (E1)
			begin
				y = E1[2];
			end
		
endmodule //moore

module Exemplo0053;
	reg x, reset;
	wire clk,m;
	
	//instância
	clock clock1(clk);
	moore1001 moore1(m,x, clk,reset);
	
	initial begin
		
		$display("Exemplo0053 - Moore FSM - Guilherme Diniz de Assumpcao - 462269");
		$display("Time    x  Moore");
		
		//initial values
		reset = 0;
		x = 0;
		
		#5 reset = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#30 x = 0;
		#20 x = 1;
		#10 $finish;
	end
	
	always @ (posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo0052