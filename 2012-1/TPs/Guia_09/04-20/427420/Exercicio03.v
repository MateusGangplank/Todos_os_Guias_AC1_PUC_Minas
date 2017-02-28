/**
 * AC I - Ciencia da Computacao - PUC MINAS
 * Jenifer Henrique Moreira Borges - 427420
 * 04/2012
 */

 //Exercicio03
`include "flipflops.v"
`include "clock.v"

module decadico (output [4:0]s, input data, input clk);

    wire [4:0] qnot;
    wire a, b;
    
    and AND1 ( a, ~qnot[0], qnot[1], ~qnot[2], qnot[3], ~qnot[4]);
    or OR1 (b,a, ~data);

    //jkff ( output q, output qnot, input    j, input    k, input clk );
    jkff JK0(s[4] , qnot[0], data, data, s[1]);
    jkff JK1(s[3] , qnot[1], data, data, s[2]);
    jkff JK2(s[2] , qnot[2], data, data, s[3]);
    jkff JK3(s[1] , qnot[3], data, data, s[4]);
    jkff JK4(s[0] , qnot[4], data, data, clk);


endmodule //decadico

module Exercicio03;
       reg data;
       wire [4:0] s;
       wire clk;

       clock Clock1 (clk);

       decadico DECAD(s,data,clk);

       initial begin
		#1 data = 1;


		$display("Exercicio03 - Jenifer Henrique - 427420\n");
		$display("Data Clock Saida");
		$monitor("%1b  %1b  %4b", data, clk, s);
		
		#100 $finish;
	end

endmodule //Exercicio03
