/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio05 - GUIA09
*
*/

`include "FlipClock.v"

module contador ( output [3:0]saida, input clk, input clear );

wire [3:0]qnot;
wire [3:0]q;

wire saiand;
wire saior;

wire N1, N2;

not   NAO1  ( N1, q[0]  );
not   NAO2  ( N2, q[2]  );

and   PORTAS ( saiand, q[3], N1, q[1], N2 );
or    CLEAR  ( saior , clear, saiand );

tff  FLIP1 ( q[0], qnot[0], clk    , clk    , saior );
tff  FLIP2 ( q[1], qnot[1], qnot[0], qnot[0], saior );
tff  FLIP3 ( q[2], qnot[2], qnot[1], qnot[1], saior );
tff  FLIP4 ( q[3], qnot[3], qnot[2], qnot[2], saior );

assign saida[0] = q[0];
assign saida[1] = q[1];
assign saida[2] = q[2];
assign saida[3] = q[3];

endmodule


module circuito;

reg clear;
wire clk;
wire [3:0] saidas;

clock  CLK1   ( clk        );

contador crescente ( saidas, clk, clear );

initial begin
clear =  1'b1;
end

initial begin
//identificaçao
$display  ( "Exercicio05" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nContador módulo 10\n" );
$monitor  ( "Saidas = %4b", saidas);
//tempo
#12  clear  = 1'b0;

#115 $finish;
end
endmodule // exercicio05


