//-- Arquitetura de Computadores ------
//------ Miller - 449049 --------------
//----------- GUIA 9 ------------------
//--------- Contador Modulo 8 ---------

`include "FFT.v"
`include "Clock.v"

module C8(output[2:0]S, output clock, input preset, input clear);

wire[2:0]q;
wire[2:0]qnot;
wire x,y;

and A(x, q[0], qnot[0], qnot[1], qnot[2]);
or A2(y, x, clear);

Clock CLK(clock);

FFT T0(q[2], qnot[2], clock, clock, preset, y);
FFT T1(q[1], qnot[1], qnot[2], qnot[2], preset, y);
FFT T2(q[0], qnot[0], qnot[1], qnot[1], preset, y);

assign S[0] = q[2];
assign S[1] = q[1];
assign S[2] = q[0];

endmodule //-- Fim do modulo C8.

module main;
wire [2:0]S;
wire clock;
reg preset, clear;

C8 Ex5(S, clock, preset, clear);

initial begin: start
preset=0;
clear=0;
end

initial begin
$display("Arquitetura de Computadores 1");
$display("Contador Modulo 8:");
$monitor("%b %d", S, S);
$display("");

#5 clear = 1;
#30 clear = 0;
#350 $finish;

end

endmodule // Fim do Exercicio 5