// --------------------
// --- Deslocamento circular em anel torcido para a direita
// --- Jenifer Henrique - 427420
// --- Exercicio 07
// --------------------

`include "Flipflops.v"
`include "clock.v"

module load ();
endmodule
module Exercicio07;

reg clr,load,d0,d1,d2,d3,d4;
wire qnot0, qnot1, qnot2, qnot3,qnot4;
wire preset1,preset2,preset3,preset4,preset5;

        and AND5(preset5,load,d4);
        and AND1(preset4,load,d3);
        and AND2(preset3,load,d2);
	and AND3(preset2,load,d1);
	and AND4(preset1,load,d0);


	dff DFF1(q4,qnot4,qnot0,clk,preset1,clr);
	dff DFF2(q3,qnot3,q4,clk,preset2,clr);
	dff DFF3(q2,qnot2,q3,clk,preset3,clr);
	dff DFF4(q1,qnot1,q2,clk,preset4,clr);
	dff DFF5(q0,qnot0,q1,clk,preset5,clr);
        
endmodule