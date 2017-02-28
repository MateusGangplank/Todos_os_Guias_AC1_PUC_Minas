//-- Arquitetura de Computadores ------
//------ Miller - 449049 --------------
//----------- GUIA 9 ------------------
//-- Contador Assincrono Decrescente --

`include "FFJK.v"
`include "Clock.v"

module CAD(output [4:0]Resposta, output clock, input i,
           input preset, input clear);

wire [4:0]q;
wire [4:0]qnot;

Clock CLK(clock);

FFJK JK0(q[0], qnot[0], i, i, clock, preset, clear);
FFJK JK1(q[1], qnot[1], i, i, qnot[0], preset, clear);
FFJK JK2(q[2], qnot[2], i, i, qnot[1], preset, clear);
FFJK JK3(q[3], qnot[3], i, i, qnot[2], preset, clear);
FFJK JK4(q[4], qnot[4], i, i, qnot[3], preset, clear);

assign Resposta[0] = qnot[0];
assign Resposta[1] = qnot[1];
assign Resposta[2] = qnot[2];
assign Resposta[3] = qnot[3];
assign Resposta[4] = qnot[4];

endmodule

module main;

wire [4:0]S;
wire clock;
reg i, preset, clear;

CAD Ex1(S, clock, i, preset, clear);

initial begin: start
i = 0;
preset=0;
clear=0;
end

initial begin
$display("Arquitetura de Computadores 1");
$display("Contador Assincrono Decrescente:");
$monitor("%b", S);
$display("");

#5 clear = 1;
#5 clear = 0;
#5 i = 1;
#300 $finish;
end

endmodule // Fim do Exercicio 1