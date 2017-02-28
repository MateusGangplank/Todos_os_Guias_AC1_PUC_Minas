// Exemplo0054 - Maquinas de estados finitos
// Nome: André Henriques Fernandes
// Matricula: 427386

//-----------
// Mealy FSM
//-----------
/* 
							Mealy FSM Diagram 
		  _____________________________________	 
		 /										  			\ 
	  	v		0 	   		1 				1 		  1|  // found 
	[start] ---> [id0] ---> [id01] ---> [id011] 
		^ \1 		  ^ \0 		   0| 			  0| // not found 
		\_/ 		  \_/ 		   / 				   | 
		 			   \__________/					/ 
		  				 \								  / 
		   			  \______________________/ 
*/ 

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
		
		$display("Mealy0111\nAndre Henriques - 427386");
		
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

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Mealy1101			30/09/2011		FSM by Mealy
 Moore1101			30/09/2011		FSM by Moore
 Exemplo0051		30/09/2011		FSM by Mealy and Moore
 Exemplo0052		01/10/2011		FSM by Mealy - sequencia 101 com intersecao
 Exemplo0053		01/10/2011		FSM by Moore - sequencia 1010 sem intersecao
 Exemplo0054		03/10/2011		FSM by Mealy - primeira sequencia 0111


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
*/