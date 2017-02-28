//--------------------------------------------
// Exercicio 03 - Guia 09
// Contador decadico de 5 bits decrescente
// Nome: Felipe Tôrres
// Matrícula: 412738
//--------------------------------------------

`include "flipFlops.v"

module contador5Bits( output [4:0]s , input signal , input pulse, input clear );
	
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	//-- tmp para saidas das portas
	wire tmp1,tmp2,tmp3;
	
	not not1(tmp1,signal);
	
	and and1(tmp2,q[0],qnot[1],q[2],qnot[3],q[4]);
	
	or or1(tmp3,tmp1,tmp2);
	
	ffJK flipFlopJK5(q[4],qnot[4],signal,signal,q[3]  , tmp3 ,clear);
	ffJK flipFlopJK4(q[3],qnot[3],signal,signal,q[2]  , tmp3 ,clear);
	ffJK flipFlopJK3(q[2],qnot[2],signal,signal,q[1]  , tmp3 ,clear);
	ffJK flipFlopJK2(q[1],qnot[1],signal,signal,q[0]  , tmp3 ,clear);
	ffJK flipFlopJK1(q[0],qnot[0],signal,signal,pulse , tmp3 ,clear);
	
	assign s[0] = q[0];
	assign s[1] = q[1];
	assign s[2] = q[2];
	assign s[3] = q[3];
	assign s[4] = q[4];

endmodule //--counter 5bits

module testeContador;
	wire [4:0]saida;
	wire pulse;
	reg signal,clear;
	
	clock clk(pulse);
	
	contador5Bits ccont5b1( saida , signal , pulse , clear );
	
	initial begin
		clear = 0;
		signal = 0;
		
		$display("\nGuia 09:");
		$display("Exercicio 03 - Contador decadico de 5 bits decrescente - Felipe Tôrres - 412738 ");
		
		$display("\nSaida:\n");
		$monitor("%5b" , saida);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		
		#100 $finish;
	end
endmodule //-- Fim testeContador