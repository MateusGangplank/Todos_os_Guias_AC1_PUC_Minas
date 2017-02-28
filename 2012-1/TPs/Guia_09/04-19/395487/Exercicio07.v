//--------------------------------------------
// Exercicio Extra 07 - Guia 09
// Contador em anel torcido
// Nome: Alvaro Henrique de Araujo Rungue
// Matrícula: 395487
//--------------------------------------------

`include "flipFlops.v"

module contadorEmAnelT(output [4:0]s , input signal , input clk , input clear );
	wire [4:0]q;
	wire [4:0]qnot;
	
	wire tmp1,tmp2;
	
	or or1(tmp1,qnot[4],signal);
	not not1(tmp2,tmp1);
	
	ffJK flip1(q[0],qnot[0],tmp1,tmp2,clk,0,clear);
	ffJK flip2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	ffJK flip3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	ffJK flip4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	ffJK flip5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	
	assign s[0] = q[4];
	assign s[1] = q[3];
	assign s[2] = q[2];
	assign s[3] = q[1];
	assign s[4] = q[0];
	
endmodule //-- Fim contadorEmAnel

module testeContadorEmAnelT;
	
	reg clear, sinal;
	wire [4:0] saida;
	wire clk;
	
	clock clk1(clk);
	
	contadorEmAnelT contadorAnelT( saida  , sinal , clk , clear);
	
	initial begin
		
		clear = 0;
		sinal = 0;
		
		$display("\nGuia 09:");
		$display("Exercicio 07 Extra - Contador Anel Torcido - Alvaro Henrique de Araujo Rungue - 395487 ");
		
		$display("\nSaida:\n");
		$monitor("%4b"  , saida);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 sinal = 1;
		#3 sinal = 0;
		
		#90 $finish;
	end
endmodule //-- Fim teste ContadorEmAnelT