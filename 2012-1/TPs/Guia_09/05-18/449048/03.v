//-- Arquitetura de Computadores ------
//------ Miller - 449049 --------------
//----------- GUIA 9 ------------------
//--- Contador Decadico Decrescente ---

`include "FFJK.v"
`include "Clock.v"

module CDD(output [4:0]Resposta, output clock,
           input i, input clear);

wire [4:0]q;
wire [4:0]qnot;
wire y, y2;

and  A(y, ~qnot[4], qnot[3], ~qnot[2], qnot[1], ~qnot[0]); 
or O(y2, ~i, y);

Clock CLK(clock);

FFJK JK0(q[0], qnot[0], i, i, clock, y2, clear);
FFJK JK1(q[1], qnot[1], i, i, q[0], y2, clear);
FFJK JK2(q[2], qnot[2], i, i, q[1], y2, clear);
FFJK JK3(q[3], qnot[3], i, i, q[2], y2, clear);
FFJK JK4(q[4], qnot[4], i, i, q[3], y2, clear);

assign Resposta[0] = q[0];
assign Resposta[1] = q[1];
assign Resposta[2] = q[2];
assign Resposta[3] = q[3];
assign Resposta[4] = q[4];

endmodule

module main;

wire [4:0]S;
wire clock;
reg i, preset, clear;

CDD Ex3(S, clock, i, clear);

initial begin: start
i = 1;
preset=0;
clear=0;
end

always
#110 clear = 1; //-- primeiro passo para resetar o contador.

always
#115 clear = 0; //-- segundo passo,o clear sera mudado para 0. Resetara o contador.

initial begin
$display("Arquitetura de Computadores 1");
$display("Contador Decadico Decrescente:");
$monitor("%b %d", S, S);
$display("");

#5 clear = 1;
#5 clear = 0;
#350 $finish;

end

endmodule // Fim do Exercicio 3