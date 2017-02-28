//-- regiS(d)trador de deslocamento para a esquerda - Left Shift Register - LSF
//-- Jos� F. R. Fonseca 405808 - PUC MINAS 02/2011
//-- vers�o 1.0 - seguindo o modelo fornecido

`include "dff.v"

module lsr (output [4:0] s, input data, input clk);

wire [4:0] lost;
wire [4:0] fios;
assign s = fios;
dff ffd1 (fios [0], lost [4], data, clk);
dff ffd2 (fios [1], lost [3], fios[0], clk);
dff ffd3 (fios [2], lost [2], fios[1], clk);
dff ffd4 (fios [3], lost [1], fios[2], clk);
dff ffd5 (fios [4], lost [0], fios[3], clk);

endmodule 