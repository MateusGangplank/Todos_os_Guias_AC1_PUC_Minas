//--------------------------------------------
// Exercicio 01 - Guia 09
// Contador assíncrono de 5 bits decrescente
// Nome: Alvaro Henrique de Araujo Rungue
// Matrícula: 395487
//--------------------------------------------

`include "flipFlops.v"

module contador5Bits( output [4:0]s , input signal , input pulse , input [4:0] preset , input clear );
	
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	ffJK flipFlopJK5(q[4],qnot[4],signal,signal,pulse  ,preset[4],clear);
	ffJK flipFlopJK4(q[3],qnot[3],signal,signal,qnot[4],preset[3],clear);
	ffJK flipFlopJK3(q[2],qnot[2],signal,signal,qnot[3],preset[2],clear);
	ffJK flipFlopJK2(q[1],qnot[1],signal,signal,qnot[2],preset[1],clear);
	ffJK flipFlopJK1(q[0],qnot[0],signal,signal,qnot[1],preset[0],clear);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];

endmodule //--counter 5bits

module testeContador;
	wire [4:0]saida;
	wire pulse;
	reg [4:0] preset;
	reg signal,clear;
	
	clock clk(pulse);
	
	contador5Bits cont5b1( saida , signal , pulse , preset , clear );
	
	initial begin
		preset = 0;
		clear = 0;
		signal = 0;
		
		$display("\nGuia 09:");
		$display("Exercicio 01 - Contador assíncrono de 5 bits decrescente - Alvaro Henrique de Araujo Rungue - 395487 ");
		
		$display("\nSaida:\n");
		$monitor("%5b", saida);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		
		#305 $finish;
	end
endmodule //-- Fim testeContador