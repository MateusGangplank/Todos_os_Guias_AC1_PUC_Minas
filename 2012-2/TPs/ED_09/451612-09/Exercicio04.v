/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio04 - GUIA09
*
*/

`include "FlipClock.v"

module contador ( output [5:0]saida, input data, input clk );

wire [5:0]qnot;
wire [5:0]q;

wire saiand;
wire saior;

wire N1, N2, N3, N4;

not   NAO1  ( N1, qnot[0]  );
not   NAO2  ( N2, qnot[2]  );
not   NAO3  ( N3, qnot[4]  );
not   NAO4  ( N4, data     );

and   PORTAS ( saiand, N1, qnot[1], N2, qnot[3], N3, qnot[5] );
or    preset ( saior , N4, saiand );

jkff3  FLIP1 ( q[0], qnot[0], data, data, clk , saior );
jkff3  FLIP2 ( q[1], qnot[1], data, data, q[0], saior );
jkff3  FLIP3 ( q[2], qnot[2], data, data, q[1], saior );
jkff3  FLIP4 ( q[3], qnot[3], data, data, q[2], saior );
jkff3  FLIP5 ( q[4], qnot[4], data, data, q[3], saior );
jkff3  FLIP6 ( q[5], qnot[5], data, data, q[4], saior );

assign saida[0] = q[0];
assign saida[1] = q[1];
assign saida[2] = q[2];
assign saida[3] = q[3];
assign saida[4] = q[4];
assign saida[5] = q[5];


endmodule


module circuito;

reg data;
wire clk;
wire [5:0] saidas;

clock  CLK1   ( clk        );

contador crescente ( saidas, data, clk );

initial begin
data =  1'b0;
end

initial begin
//identificaçao
$display  ( "Exercicio04" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nContador decádico decrescente\n" );
$monitor  ( "Saidas = %6b", saidas);
//tempo
#12  data  = 1'b1;

#500 $finish;
end
endmodule // exercicio04


