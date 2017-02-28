//-- conversor paralelo para serial p2s
//-- José F. R. Fonseca 405808 - PUC MINAS 02/2011
//-- versão 1.0 - seguindo o modelo fornecido

`include "dff.v"

module p2s (output [4:0] s, input [4:0] data, input clk, input load);

wire orum;
wire [4:0] lost;
wire [4:0] fios;
wire [4:0] ad;
assign s = fios;

and and1 (ad[0], ld, data[0]);
and and2 (ad[1], ld, data[1]);
and and3 (ad[2], ld, data[2]);
and and4 (ad[3], ld, data[3]);
and and5 (ad[4], ld, data[4]);

dff ffd1 (fios [0], lost [4], ad[0], clk);
dff ffd2 (fios [1], lost [3], ad[1], clk);
dff ffd3 (fios [2], lost [2], ad[2], clk);
dff ffd4 (fios [3], lost [1], ad[3], clk);
dff ffd5 (fios [4], lost [0], ad[4], clk);

endmodule 