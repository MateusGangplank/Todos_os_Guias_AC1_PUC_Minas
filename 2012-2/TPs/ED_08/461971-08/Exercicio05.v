// -------------------------
// Exercicio05 Guia 08
// CONVERSOR PARALELO-SERIE 5 BITS
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
`include "FlipFlopD.v"
module teste;
wire clock;
clock clk ( clock );
reg clr, ld;
reg [4:0] data;
wire [4:0] s;
wire [4:0] snot;
wire [4:0] preset;
and ( preset[0], ld, data[0] );
and ( preset[1], ld, data[1] );
and ( preset[2], ld, data[2] );
and ( preset[3], ld, data[3] );
and ( preset[4], ld, data[4] );

dff d1 (s[0], snot[0], s[1] ,preset[0], clr, clock);
dff d2 (s[1], snot[1], s[2] ,preset[1], clr, clock);
dff d3 (s[2], snot[2], s[3] ,preset[2], clr, clock);
dff d4 (s[3], snot[3], s[4] ,preset[3], clr, clock);
dff d5 (s[4], snot[4], 0 ,preset[4], clr, clock);


initial begin
$dumpfile ( "Exercicio05.vcd" );
$dumpvars;
clr = 1; ld = 0; data = 5'b11001;
#13 clr = 0;
#10 ld = 1;
#14
$monitor ("%b,--> %b", data, s[0]);
#1 ld = 0;

#896 $finish;
end
endmodule // teste