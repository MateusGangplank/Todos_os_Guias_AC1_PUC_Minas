/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio03 - GUIA09
*
*/

`include "FlipClock.v"

module contador ( output [5:0]saida, input data, input clk, input clear );

wire [5:0]qnot;
wire [5:0]q;

wire negar1;
wire negar2;

wire N1, N2, N3;

not   NAO1  ( N1, q[0]  );
not   NAO2  ( N2, q[2]  );
not   NAO3  ( N3, q[4]  );

nand  PORTAS ( negar2, N1, q[1], N2, q[3], N3, q[5] );
nand  limpar ( negar1, clear, negar2 );

jkff2  FLIP1 ( q[0], qnot[0], data, data, clk    , negar1 );
jkff2  FLIP2 ( q[1], qnot[1], data, data, qnot[0], negar1 );
jkff2  FLIP3 ( q[2], qnot[2], data, data, qnot[1], negar1 );
jkff2  FLIP4 ( q[3], qnot[3], data, data, qnot[2], negar1 );
jkff2  FLIP5 ( q[4], qnot[4], data, data, qnot[3], negar1 );
jkff2  FLIP6 ( q[5], qnot[5], data, data, qnot[4], negar1 );

assign saida[0] = q[0];
assign saida[1] = q[1];
assign saida[2] = q[2];
assign saida[3] = q[3];
assign saida[4] = q[4];
assign saida[5] = q[5];


endmodule


module circuito;

reg data;
reg clear;
wire clk;
wire [5:0] saidas;

clock  CLK1   ( clk        );

contador crescente ( saidas, data, clk, clear );

initial begin
clear = 1'b0;
data =  1'b0;
end

initial begin
//identificaçao
$display  ( "Exercicio03" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nContador decádico crescente\n" );
$monitor  ( "Saidas = %6b    Clock = %b", saidas, clk );
//tempo
#16  clear = 1'b1;  data  = 1'b1;

#530 $finish;
end
endmodule // exercicio03


