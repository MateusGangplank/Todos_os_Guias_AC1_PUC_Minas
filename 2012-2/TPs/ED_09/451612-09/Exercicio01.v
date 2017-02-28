/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio01 - GUIA09
*
*/

`include "FlipClock.v"

module contador ( output [4:0]saida, input data, input clk, input clear );

wire [4:0] q;

jkff  FLIP1 ( q[0], saida[0], data, data, clk     , clear );
jkff  FLIP2 ( q[1], saida[1], data, data, saida[0], clear );
jkff  FLIP3 ( q[2], saida[2], data, data, saida[1], clear );
jkff  FLIP4 ( q[3], saida[3], data, data, saida[2], clear );
jkff  FLIP5 ( q[4], saida[4], data, data, saida[3], clear );


endmodule


module circuito;

reg data;
reg clear;
wire clk;
wire [4:0] saidas;

clock  CLK1   ( clk        );

contador decrescente ( saidas, data, clk, clear );

initial begin
data  = 1'b0;
clear = 1'b0;
end


initial begin
//identificaçao
$display  ( "Exercicio01" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nContador assíncrono decrescente\n" );
$monitor  ( "Saidas = %4b ", saidas );
//tempo
#12  clear = 1'b1;
#16  data  = 1'b1;
#180 $finish;
end
endmodule // exercicio01


