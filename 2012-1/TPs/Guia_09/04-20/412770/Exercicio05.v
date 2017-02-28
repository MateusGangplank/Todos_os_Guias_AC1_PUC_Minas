//--------------------------------------------
// Exercicio 05 - Guia 09
// Contador modulo 8
// Nome: Rayan Darwin
// Matrícula: 412770
//--------------------------------------------

`include "flipFlops.v"

module contadorBase8(output [3:0]s,input pulse, input clear);
	
	wire [3:0]q;
	wire [3:0]qnot;
	wire tmp1,tmp2;
	
	and and1(tmp1,q[0],qnot[1],qnot[2],qnot[3]);
	or or1(tmp2,tmp1,clear);
	
	ffT t4(q[3],qnot[3],pulse  ,pulse  ,0,tmp2);
	ffT t3(q[2],qnot[2],qnot[3],qnot[3],0,tmp2);
	ffT t2(q[1],qnot[1],qnot[2],qnot[2],0,tmp2);
	ffT t1(q[0],qnot[0],qnot[1],qnot[1],0,tmp2);
	
	assign s[0] = q[3];
	assign s[1] = q[2];
	assign s[2] = q[1];
	assign s[3] = q[0];
	
endmodule //--contadorBase8

module testecontadorBase8;
	reg clear;
	wire [3:0]saida;
	wire pulse;
	
	clock clk(pulse);
	
	contadorBase8 bc(saida,pulse,clear);
	
	initial begin
		clear = 0;
		$display("\nGuia 09:");
		$display("Exercicio 05 - Contador Base 8 - Rayan Darwin - 412770 ");
		
		$display("\nSaida:\n");
		$monitor("%4b"  , saida);
		#1 clear = 1;
		#1 clear = 0;
		#100 $finish;
		
	end
endmodule //-- Fim testecontadorBase8