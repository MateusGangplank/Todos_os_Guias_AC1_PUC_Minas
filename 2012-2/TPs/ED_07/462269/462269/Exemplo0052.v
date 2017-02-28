//------------------
//--- Mealy1001 FSM
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
//------------------


/*
					Mealy FSM Diagram
		___________________________________
	  /											  \
	 /												   \
	v		1				0				0		  0|
[start] ---> [id1] ---> [id10] ---> [id100]
 ^	 \0		  ^ \1			/1				  1|//found
  \_/			  \_/			  /					|
					\_________/					 	/
					 \								  /
					  \______________________/
*/


`include "clock.v"

`define found 1
`define notfound 0

module mealy1001(y,x,clk,reset);
	output y;
	input x,clk,reset;
	reg y;
	
	parameter
		start = 2'b00,
		id1 = 2'b01,
		id10 = 2'b10,
		id100 = 2'b11;
	
	reg[1:0]E1;
	reg[1:0]E2;
	
	always @ (x or E1)
		begin
			y = `notfound;
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
						begin
							E2 = id1;
							y = `found;
						end
					else
						begin
							E2 = start;
							y = `notfound;
						end
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
			end //always at signal changing
	
endmodule //mealy1001

module Exemplo0052;
	reg x, reset;
	wire clk,m;
	
	//instância
	clock clock1(clk);
	mealy1001 mealy1(m,x, clk,reset);
	
	initial begin
		
		$display("Exemplo0052 - Mealy FSM - Guilherme Diniz de Assumpcao - 462269");
		$display("Time    x  Mealy");
		
		//initial values
		reset = 0;
		x = 0;
		//clk = 1;
		
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
		#10 $finish;
	end
	
	always @ (posedge clk)
		begin
			$display("%4d %4b %5b",$time,x,m);
		end
endmodule //Exemplo0052