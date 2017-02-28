//-------------------
//--- Moore 1110 FSM
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
//-------------------

`include "clock.v"

/*

		  1			1			1				0
[start]--->[id1]--->[id11]--->[id111]--->[idfinish]//found
 ^ \0		 	/0		 	0/			 ^ \1
 \_/		  /			/			 \_/
  \		 /			  /
   \_____/			 /
	 \					/
	  \___________/

*/

module moore1110(y,x,clk,reset);
	output y;
	input x,clk,reset;
	reg y;
	
	parameter
		start = 3'b000,
		id1 = 3'b001,
		id11 = 3'b011,
		id111 = 3'b010,
		idfinish = 3'b100;
	
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
						E2 = id11;
					else
						E2 = start;
				id11:
					if(x)
						E2 = id111;
					else
						E2 = start;
				id111:
					if(x)
						E2 = id111;
					else
						E2 = idfinish;
				idfinish:
					#10 $finish;
				default:
					E2 = 2'bxx;
			endcase
		end //always at state or signal changing
		
		always @(posedge clk or negedge reset)
			begin
				if(reset)
					E1 = E2;
				else
					E1 = 0;
			end
		
		always @(E1)
			begin
				y = E1[2];
			end
		
endmodule //moore

module Exemplo0053;
	reg x, reset;
	wire clk,m;
	
	//instância
	clock clock1(clk);
	moore1110 moore1(m,x, clk,reset);
	
	initial begin
		
		$display("Exemplo0053 - Moore FSM - Guilherme Diniz de Assumpcao - 462269");
		$display("Time    x  Moore");
		
		//initial values
		reset = 0;
		x = 0;
		
		#5 reset = 1;
		#10 x = 1;
		#30 x = 0;
		#10 x = 0;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#10 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#30 x = 0;
		#10 x = 0;
	end
	
	always @ (posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo0052