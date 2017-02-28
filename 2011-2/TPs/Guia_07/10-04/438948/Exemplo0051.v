// Mealy/Moore - Maquinas de estados finitos
// Nome: Tiago Moreira
// Matricula: 438948

//----------------
// Mealy-Moore FSM
//----------------

//dependencias
`include "Mealy1101.v"
`include "Moore1101.v"

//constant definitions
`define found		1
`define notfound	0

//FSM by Mealy and Moore
module Exemplo0051;
	reg clk,reset,x;
	wire m1,m2;
	
	mealy1101 mealy1(m1,x,clk,reset);
	moore1101 moore1(m2,x,clk,reset);
	
	initial begin
		$display("Time X Mealy Moore");
		
		//initial values
		clk = 1;
		reset = 0;
		x = 0;
		
		//input signal changing
		#5	reset = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#20 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		
		#30 $finish;
	end //initial
	
	always
		#5 clk = ~clk;
		
	always @(posedge clk)
		begin
			$display("%4d %4b %4b %5b",$time,x,m1,m2);
		end //always at positive edge clock changing
endmodule //Exemplo0051

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Mealy1101			30/09/2011		FSM by Mealy
 Moore1101			30/09/2011		FSM by Moore
 Exemplo0051		30/09/2011		FSM by Mealy and Moore

			Testes e Resultados

 Mealy1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
 Moore1101
 	*obs: nao conseguir fazer o programa identificar 1101, por isso,
			nao pude realizar mais testes
			
 Exemplo0051
 	Mealy conseguiu identificar a entrada 1101, mas a saida final da FSM de Moore foi x.
*/