//-------------------------------------
//Moore FSM 3 bits iguais
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-------------------------------------

`include "clock.v"

`define found 1
`define notfound 0


/*					Diagram
					___________________
				 /							 \
				/							  \
			  /								\
		0	 v   	0			 0			  0|
	 ---> [id0]---> [id00]---> [id000]//found
	/	 	 ^ |1		  /1			  /1
			 |\|______/______		 /
			 | |		/	\	  \___/__
[start]	 | | ___/___|_______/	\
			 | |/			|				 \
	\	1  0| v  1	  0|	1			0|
	 ---> [id1]--->[id11]--->[id111]//found
			 ^								1|
			 \								/
			  \						  /
			   \__________________/
*/	

module mooreiguais(y,x,clk,reset);
	output y;
	input x, clk, reset;
	reg y;
	
	reg aux = 1'bx;
	
	reg[3:0]E1;
	reg[3:0]E2;
	
	parameter
		start = 4'b0000,
		id0 = 4'b0001,
		id00 = 4'b0010,
		id000 = 4'b1000,
		id1 = 4'b0011,
		id11 = 4'b0100,
		id111 = 4'b1001;
	
	always @ (x or E1)
		begin
			case(E1)
				start:
					if(x)
						E2 = id1;
					else
						E2 = id0;
				id1:
					if(x)
						E2 = id11;
					else
						E2 = id0;
				id11:
					if(x)
						E2 = id111;
					else
						E2 = id0;
				id111:
					if(x)
						E2 = id1;
					else
						E2 = id0;
				id0:
					if(x)
						E2 = id1;
					else
						E2 = id00;
				id00:
					if(x)
						E2 = id1;
					else
						E2 = id000;
				id000:
					if(x)
						E2 = id1;
					else
						E2 = id0;
				default:
					E2 = 4'bxxxx;
			endcase
		end
	
	always @(posedge clk or negedge reset)
		begin
			if(reset)
				E1 = E2;
			else
				E1 = 0;
		end
	
	always @(E1)
		begin
			y = E1[3];
		end
endmodule //moore3iguais

module Exemplo0056;
	reg x, reset;
	wire m, clk;
	
	clock clock1(clk);
	mooreiguais moore1(m,x,clk,reset);
	
	initial begin:start
		x = 0;
		reset = 0;
	end
	
	initial begin:main
		$display("Exemplo0056 - Moore FSM 3 bits iguais - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Time   x   Moore");
		
		#5 reset = 1;
		#10 x = 0;
		#10 x = 1;
		#30 x = 0;
		#30 x = 1;
		#30 x = 0;
		#10 $finish;
	end
	
	always @(posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo 0056