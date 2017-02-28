// Moore1101 - Maquinas de estados finitos
//Nome: André Henriques Fernandes
// Matricula: 427386

//-----------
// Moore FSM
//-----------
/* 
							Moore FSM Diagram 
		  				 				 __________________________
		 								/						  			\ 
	  			1 	   		1 	  v		0 		  		1		  1 | // found 
	[start] ---> [id1] ---> [id11] ---> [id110] ---> [id1101]
		^ \0 			0| 		1/  ^ 			  0 | 		0|
		\_/ 		 	/ 			 \__/ 				 | 		 |
		 \_________/ 									/ 			/
		  \ 											  / 		  /
		   \_________________________________/ 		 /
			 \														/
			  \______________________________________/
*/ 

//constant definitions
`define found		1
`define notfound	0

//FSM by Moore
module moore1101(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 3'b000,
		id1 = 3'b001,
		id11 = 3'b011,
		id110 = 3'b010,
		id1101 = 3'b110; //signal found
		
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
							E2 = id11;
						else
							E2 = start;
					id11:
						if (x)
							E2 = id11;
						else
							E2 = id110;
					id110:
						if (x)
							E2 = id1101;
						else
							E2 = start;
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
				
		//ouput logic
			always @ (E1)
				begin
					y = E1[2]; //first bit of state value
				end //always at state changing
				
endmodule //moore1101

// -----------
//	Test Moore
// -----------
module testMoore1101;
	reg x,reset,clk;
	wire y;
	
	moore1101 m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("Moore1101\nAndre Henriques - 427386");
		
		$display("Clk  Rst  x  y");
		#4 x = 1'b0;
		#2 x = 1'b1;
		#4 $finish;
		end
		
	always
		#1 clk = ~clk;
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b  %b",$time,reset,x,y);
		end

endmodule //testMoore

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Mealy1101			30/09/2011		FSM by Mealy
 Moore1101			30/09/2011		FSM by Moore

			Testes e Resultados

 Mealy1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
 Moore1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
*/