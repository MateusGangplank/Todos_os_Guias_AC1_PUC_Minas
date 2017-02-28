/**---------------------------------------
 * AC I - Ciencia da Computacao - PUC MINAS
 * Roger Rubens Machado - 430533
 */
 
 //Exercicio06
`include "flipflops.v"
`include "clock.v"

module anel (output [4:0]s, input data, input clr, input clk);
    wire a;
    or OR1 (a, data, s[0]);

    //jkff ( output q, output qnot, input    j, input    k, input clk );
    jkff JK0(s[4] , , a, ~a, clk);
    jkff JK1(s[3] , , s[4], ~s[4], clk);
    jkff JK2(s[2] , , s[3], ~s[3], clk);
    jkff JK3(s[1] , , s[2], ~s[2], clk);
    jkff JK4(s[0] , , s[1], ~s[1], clk);


endmodule //anel

module Exercicio06;
       reg data, clr;
       wire [4:0] s;
       wire clk;

       clock Clock1 (clk);

       anel ANEL1 (s,data,clr,clk);

       initial begin
		#1 data = 1;
		#1 clr = 0;

		$display("Exercicio06 - Roger Rubens Machado - 430533\n");
		$display("Data Clear Clock Saida");
		$monitor("%1b  %1b  %1b  %3b", data, clr, clk, s);

                #1 data = 0;
                #1 data = 1;
                #1 data = 0;
                #1 data = 1;

		#100 $finish;
	end

endmodule //Exercicio06
