/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Extra02 - GUIA09
*
*/

`include "FlipClock.v"

module contador ( output [5:0]saida, input clk, input data, input clear );

wire [5:0]qnot;
wire [5:0]q;

wire saiand;
wire saior;

wire [5:0]N;

or    DQNO  ( saior, data, qnot[5] );

not   NAO0  ( N[0], saior  );
not   NAO1  ( N[1], q[0]   );
not   NAO2  ( N[2], q[1]   );
not   NAO3  ( N[3], q[2]   );
not   NAO4  ( N[4], q[3]   );
not   NAO5  ( N[5], q[4]   );


jkff  FLIP1 ( q[0], qnot[0], saior, N[0], clk, clear);
jkff  FLIP2 ( q[1], qnot[1], q[0] , N[1], clk, clear);
jkff  FLIP3 ( q[2], qnot[2], q[1] , N[2], clk, clear);
jkff  FLIP4 ( q[3], qnot[3], q[2] , N[3], clk, clear);
jkff  FLIP5 ( q[4], qnot[4], q[3] , N[4], clk, clear);
jkff  FLIP6 ( q[5], qnot[5], q[4] , N[5], clk, clear);

assign saida[0] = q[5];
assign saida[1] = q[4];
assign saida[2] = q[3];
assign saida[3] = q[2];
assign saida[4] = q[1];
assign saida[5] = q[0];


endmodule


module circuito;

reg data;
reg clear;
wire clk;
wire [5:0] saidas;

clock  CLK1   ( clk        );

contador crescente ( saidas, clk, data, clear );

initial begin
clear = 1'b0;
data  = 1'b0;
end

initial begin
//identificaçao
$display  ( "Extra02" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nContador em anel torcido\n" );
$monitor  ( "Saidas = %6b", saidas);
//tempo
#12  clear  = 1'b1;  data = 1'b0;

#200 $finish;
end
endmodule // extra02


