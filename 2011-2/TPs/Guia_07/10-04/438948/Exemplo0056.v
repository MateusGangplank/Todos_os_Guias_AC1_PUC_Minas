// Exemplo0056 - Maquinas de estados finitos
// Nome: Tiago Moreira
// Matricula: 438948

//-----------
// Mealy FSM
//-----------
/* 
							Mealy FSM Diagram 
		  _______________________________________
		 /										  			\ \ 
	  	v		0 	   		0 				0 		  0| |  // found 
	[start] ---> [id0] ---> [id00] ---> [id000] |
	 |	^				1|				1|				1|	  |
	 |	 \___________/				/				/    |
	 |	  \____________________/			  /  	  |
	 |		\______________________________/  	  |
	 |												   	  |				
	 |			1				1				1			1/
	 |----------> [id1] ---> [id11] ---> [id111]
	 \		 		   0| 		   0| 			  0| // not found 
	  \_____________/ 		   / 				   | 
		\______________________/					/ 
		 \          								  / 
		  \__________________________________/ 
*/ 

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
		
		$display("MealyEquals\nNome: Tiago Moreira\nMatricula: 438948");
		
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

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Mealy1101			30/09/2011		FSM by Mealy
 Moore1101			30/09/2011		FSM by Moore
 Exemplo0051		30/09/2011		FSM by Mealy and Moore
 Exemplo0052		01/10/2011		FSM by Mealy - sequencia 101 com intersecao
 Exemplo0053		01/10/2011		FSM by Moore - sequencia 1010 sem intersecao
 Exemplo0054		03/10/2011		FSM by Mealy - primeira sequencia 0111
 Exemplo0055		03/10/2011		FSM by Mealy - sequencia de 4 bits terminada em 111
 Exemplo0056		03/10/2011		FSM by Mealy - sequencia de 4 bits iguais



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
			
 Exemplo0054
 	*obs: nao conseguir fazer o programa identificar 0111, por isso,
			nao pude realizar mais testes
			
 Exemplo0055
 	*obs: nao conseguir fazer o programa identificar 111, por isso,
			nao pude realizar mais testes
	
 Exemplo0056
 	*obs: nao conseguir fazer o programa identificar 1111 nem 0000, por isso,
			nao pude realizar mais testes
*/