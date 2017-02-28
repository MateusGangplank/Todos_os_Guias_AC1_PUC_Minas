//-- Arquitetura de Computadores ------
//------ Miller - 449049 --------------
//----------- GUIA 9 ------------------
//---- Contador Decadico Crescente ----

`include "FFJK.v"
`include "Clock.v"

module CDC(output[4:0]S, output clock, input i, input preset, input clear);

wire[4:0]q;
wire[4:0]qnot;
wire x,y;

nand A(x, ~q[0], q[1], ~q[2], q[3], ~q[4]);
nand A2(y, x, ~clear);

Clock CLK(clock);

FFJK JK0(q[0], qnot[0], i, i, clock, preset, y);
FFJK JK1(q[1], qnot[1], i, i, qnot[0], preset, y);
FFJK JK2(q[2], qnot[2], i, i, qnot[1], preset, y);
FFJK JK3(q[3], qnot[3], i, i, qnot[2], preset, y);
FFJK JK4(q[4], qnot[4], i, i, qnot[3], preset, y);

assign S[0] = q[0];
assign S[1] = q[1];
assign S[2] = q[2];
assign S[3] = q[3];
assign S[4] = q[4];

endmodule //-- Fim do modulo CDC.

module main;
wire [4:0]S;
wire clock;
reg i, preset, clear;

CDC Ex4(S, clock, i, preset, clear);

initial begin: start
i = 1;
preset=0;
clear=0;
end

initial begin
$display("Arquitetura de Computadores 1");
$display("Contador Decadico Crescente:");
$monitor("%b %d", S, S);
$display("");

#5 clear = 1;
#30 clear = 0;
#350 $finish;

end

endmodule // Fim do Exercicio 4