/**
 * AC I - Ciencia da Computacao - PUC MINAS
 * Jenifer Henrique Moreira Borges - 427420
 * 10/2012
 */

 //Exercicio01
`include "flipflops.v"
`include "clock.v"

module contador (output [4:0]s, input data, input clk, input clr );
  
    //jkff ( output q, output qnot, input    j, input    k, input clk );
    jkff JK0( , s[0], data, data, clk);
    jkff JK1( , s[1], data, data, s[0]);
    jkff JK2( , s[2], data, data, s[1]);
    jkff JK3( , s[3], data, data, s[2]);
    jkff JK4( , s[4], data, data, s[3]);


endmodule //contador

module Exercicio01;
       reg data, clr;
       wire [4:0] s;
       wire clk;

       clock Clock1 (clk);

       contador CONT(s,data,clk,clr);

       initial begin
		#1 data = 1;
		#1 clr = 0;

		$display("Exercicio01 - Jenifer Henrique - 427420\n");
		$display("Data Clear Clock Saida");
		$monitor("%1b  %1b  %1b  %4b", data, clr, clk, s);
		
		#100 $finish;
	end

endmodule //Exercicio01
