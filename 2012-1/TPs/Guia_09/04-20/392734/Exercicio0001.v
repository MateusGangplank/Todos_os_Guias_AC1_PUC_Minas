//------------------------------------------------
//Exercicio0001
//Nome: João Henrique Mendes de Oliveira
//Matrícula: 392734
//------------------------------------------------

`include "flipflops.v"

module counter5bits(output [4:0]s, input signal,
				input pulse,input [4:0]preset,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	jkff flip5(q[4],qnot[4],signal,signal,pulse,preset[4],clear);
	jkff flip4(q[3],qnot[3],signal,signal,qnot[4],preset[3],clear);
	jkff flip3(q[2],qnot[2],signal,signal,qnot[3],preset[2],clear);
	jkff flip2(q[1],qnot[1],signal,signal,qnot[2],preset[1],clear);
	jkff flip1(q[0],qnot[0],signal,signal,qnot[1],preset[0],clear);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
endmodule //counter 5bits

module principal;
	wire [4:0]saida;
	wire pulse;
	reg [4:0] preset;
	reg signal,clear;
	
	clock clk(pulse);
	
	counter5bits c1(saida,signal,pulse,preset,clear);
	
	initial begin
		preset = 0;
		clear = 0;
		signal = 0;
		
		$display("Exercicio0001 - Contador assíncrono 5 bits - João Henrique - 392734");
		$display("bin \t- \tdecimal");
		$monitor("%5b \t- \t%d",saida,saida);
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		
		#630 $finish;
	end
endmodule //principal