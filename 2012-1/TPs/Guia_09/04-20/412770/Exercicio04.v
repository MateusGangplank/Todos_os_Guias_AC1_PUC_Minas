//--------------------------------------------
// Exercicio 04 - Guia 09
// Contador decadico de 5 bits crescente
// Nome: Rayan Darwin
// Matrícula: 412770
//--------------------------------------------

`include "flipFlops.v"

module contador5Bits( output [4:0]s , input signal , input pulse, input clear );
	
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	//-- tmp para saidas das portas
	wire tmp1,tmp2,tmp3;
	
	
	nand nand1(tmp1,qnot[0],q[1],qnot[2],q[3],qnot[4]);
	nand nand2(tmp2,clear,tmp1);
	
	ffJK flipFlopJK5(q[4],qnot[4],signal,signal,qnot[3],0,tmp2);
	ffJK flipFlopJK4(q[3],qnot[3],signal,signal,qnot[2],0,tmp2);
	ffJK flipFlopJK3(q[2],qnot[2],signal,signal,qnot[1],0,tmp2);
	ffJK flipFlopJK2(q[1],qnot[1],signal,signal,qnot[0],0,tmp2);
	ffJK flipFlopJK1(q[0],qnot[0],signal,signal,pulse  ,0,tmp2);
	
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
	
	contador5Bits cont5b1( saida , signal , pulse , clear );
	
	initial begin
		clear = 0;
		signal = 0;
		
		$display("\nGuia 09:");
		$display("Exercicio 04 - Contador decadico de 5 bits crescente - Rayan Darwin - 412770 ");
		
		$display("\nSaida:\n");
		$monitor("%5b" , saida);
		
		#1 clear = 1;
		
		#1 signal = 1;
		
		#100 $finish;
	end
endmodule //-- Fim testeContador