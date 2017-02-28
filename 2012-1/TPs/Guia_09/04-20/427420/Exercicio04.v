/**
 * AC I - Ciencia da Computacao - PUC MINAS
 * Jenifer Henrique Moreira Borges - 427420
 * 04/2012
 */

 //Exercicio04
`include "flipflops.v"
`include "clock.v"

module decadico (output [4:0]s, input data, input clk, input clr);

    wire [4:0] qnot;
    wire a, b;
    
    nand NAND1 ( a, ~s[4], s[3], ~s[2], s[1], ~s[0]);
    nand NAND2 ( b, a, clr);

    //jkff ( output q, output qnot, input    j, input    k, input clk );
    jkff JK0(s[4] , qnot[0], data, data, qnot[1]);
    jkff JK1(s[3] , qnot[1], data, data, qnot[2]);
    jkff JK2(s[2] , qnot[2], data, data, qnot[3]);
    jkff JK3(s[1] , qnot[3], data, data, qnot[4]);
    jkff JK4(s[0] , qnot[4], data, data, clk);


endmodule //decadico

module Exercicio04;
       reg data, clr;
       wire [4:0] s;
       wire clk;

       clock Clock1 (clk);

       decadico DECAD(s,data,clk, clr);

       initial begin
		#1 data = 1; clr = 1;

		$display("Exercicio04 - Jenifer Henrique - 427420\n");
		$display("Data Clear Clock Saida");
		$monitor("%1b  %1b  %1b   %4b", data,clr, clk, s);
		
		#100 $finish;
	end

endmodule //Exercicio04
