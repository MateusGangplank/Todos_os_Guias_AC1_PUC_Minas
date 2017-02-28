// Exemplo0053 - Maquinas de estados finitos
// Nome: Tiago Moreira
// Matricula: 438948

//-----------
// Moore FSM
//-----------
/* 
							Moore FSM Diagram 
		   ______________________________________________
		  /						  		 							 \ 
	  	 v		1 	   		0 	  			1 		  		0		  | // found 
	[start] ---> [id1] ---> [id10] ---> [id101] ---> [id1010]
		^ \0 		 ^	 1| 			0|				  1 |
		\_/ 		  \_/ 		 	/	 				 |
		 \__________\__________/					/
		   			 \								  /
						  \______________________/
*/ 

//constant definitions
`define found		1
`define notfound	0

//FSM by Moore
module moore1010(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 3'b000,
		id1 = 3'b001,
		id10 = 3'b011,
		id101 = 3'b010,
		id1010 = 3'b110; //signal found
		
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
							E2 = id101;
						else
							E2 = start;
					id101:
						if (x)
							E2 = id1;
						else
							E2 = id1010;
					id1010:
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
	
	moore1010 m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("Moore1010\nNome: Tiago Moreira\nMatricula: 438948");
		
		$display("Clk  Rst  x  y");
		#2 x = 1'b0;
		#2 x = 1'b1;
		#2 x = 1'b0;
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
 Exemplo0051		30/09/2011		FSM by Mealy and Moore
 Exemplo0052		01/10/2011		FSM by Mealy - sequencia 101 com intersecao
 Exemplo0053		01/10/2011		FSM by Moore - sequencia 1010 sem intersecao


			Testes e Resultados

 Mealy1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
 Moore1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
 Exemplo0051
 	Mealy conseguiu identificar a entrada 1101, mas a saida final da FSM de Moore foi x.
	
 Exemplo0052
 	*obs: nao conseguir fazer o programa identificar 101, por isso,
			nao pude realizar mais testes

 Exemplo0053
 	*obs: nao conseguir fazer o programa identificar 1010, por isso,
			nao pude realizar mais testes
*/