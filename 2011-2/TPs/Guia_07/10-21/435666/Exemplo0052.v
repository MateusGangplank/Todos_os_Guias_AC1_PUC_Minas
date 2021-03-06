// Exemplo0052 - Maquinas de estados finitos
// Nome: Julio Machado
// Matricula: 435666

//-----------
// Mealy FSM
//-----------
/* 
							Mealy FSM Diagram 
		  				 ____________
		 				/				 \ 
	  			1 	  v 		0 		 1| // found 
	[start] ---> [id1] ---> [id10]
		^ \0 		  ^ \1 		    0| // not found 
		\_/ 		  \_/	 			  |
		 \ 							 / 
		  \_____________________/ 
*/ 

//constant definitions
`define found		1
`define notfound	0

//FSM by Mealy
module mealy101(y,x,clk,reset);
	output y;
	input x;
	input clk;
	input reset;
	
	reg y;
	
	parameter	//state identifiers
		start = 2'b00,
		id1 = 2'b01,
		id10 = 2'b11;
		
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
							begin
								E2 = id1;
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
				
endmodule //mealy101

// -----------
//	Test Mealy
// -----------
module testMealy101;
	reg x,reset,clk;
	wire y;
	
	mealy101 m1(y,x,clk,reset);
	
	initial
		begin
			x = 1'b1;
			reset = 1'b1;
			clk = 1'b0;
		end
	
	initial
		begin
		
		$display("Mealy101\nNome: JUlio machado \nMatricula: 435666");
		
		$display("Clk  Rst  x  y");
		#2 x = 1'b0;
		#2 x = 1'b1;
		#4 $finish;
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
*/