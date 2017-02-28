//-------------------------------------
//Mealy 3 bits iguais a 0
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
//-------------------------------------

`include "clock.v"

`define found 1
`define notfound 0


/*
					 __________________
					/						 \
				  /						  \
				 /								\
		 1/0	v		0			0		  0| //found
[start]--->[idx]--->[idx0]--->[idx00]
				^ \1			/1			  1|
				\_/		  /				/
				 \			 /				  /
				  \______/				 /
				   \						/
					 \_______________/

*/


module mealyXequal(y,x,clk,reset);
	output y;
	input x, clk, reset;
	reg y;
	
	parameter
		start = 2'b00,
		idx = 2'b01,
		idx0 = 2'b11,
		idx00 = 2'b10;
	
	reg[1:0] E1;
	reg[1:0] E2;
	
	always @(x or E1)
		begin
			y = `notfound;
			case(E1)
				start:
					E2 = idx;
				idx:
					if(x)
						E2 = idx;
					else
						E2 = idx0;
				idx0:
					if(x)
						E2 = idx;
					else
						E2 = idx00;
				idx00:
					if(x)
						begin
							E2 = idx;
							y = `notfound;
						end
					else
						begin
							E2 = idx;
							y = `found;
						end
				default:
					E2 = 2'bxx;
			endcase
		end
		
		always @ (posedge clk or negedge reset)
			begin
				if(reset)
					E1 = E2;
				else
					E1 = 0;
			end
endmodule  //mealyXequal

module Exemplo0055;
	reg x, reset;
	wire m, clk;
	
	clock clock1(clk);
	mealyXequal mealy1(m,x,clk,reset);
	
	initial begin
		$display("Mealy 3 bits iguais a 0 - Guilherme Diniz de Assumpcao - 462269");
		$display("Time   x   Mealy");
		
		//valores iniciais
			x = 0;
			reset = 0;
			
			#5 reset = 1;
			#10 x = 0;
			#30 x = 1;
			#10 x = 0;
			#30 x = 1;
			
			#30 $finish;
	end //initial
	
	always @ (posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo0055