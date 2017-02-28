/**
 * AC I - Ciencia da Computacao - PUC MINAS
 * Rayan Darwin - 412770
 * 10/2012
 */
 
 //Exercicio05
`include "flipflops.v"
`include "clock.v"

module cont8 (output [3:0]s, input data, input clr );
    wire [3:0] qnot;
    wire [3:0] q;
    wire [3:0] preset;
    wire a, b;

    and AND1 (a, ~s[0], s[1], ~s[2], s[3] );
    or OR1 (b, a, clr );

    //tff ( output q, output qnot,  input    t, input    clk,   input    preset, input clear );
    tff TFF0 (s[0], qnot[0], data, data, , b);
    tff TFF1 (s[1], qnot[1], qnot[0], qnot[0], , b);
    tff TFF2 (s[2], qnot[2], qnot[1], qnot[1], , b);
    tff TFF3 (s[3], qnot[3], qnot[2], qnot[2], , b);
endmodule //cont8

module Exercicio05;
       reg data, clr;
       wire [3:0] s;

       cont8 CONT(s,data,clr);
       
       initial begin
		#1 data = 1;
		#1 clr = 0;

		$display("Exercicio05 - Rayan Darwin - 412770\n");
		$display("Data Clear Saida");
		$monitor("%1b  %1b  %3b", data, clr, s);

		#5 data = 0;
		#5 data = 1;
		#5 data = 0;
		#5 data = 1;
		#5 data = 0;
		#5 data = 1;
		#5 data = 0;
		#5 data = 1;
		#5 data = 0;
		#5 data = 1;
		#100 $finish;
	end

endmodule //Exercicio05
