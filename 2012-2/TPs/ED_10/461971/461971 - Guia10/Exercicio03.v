// -------------------------
// Exercicio03 Guia 10
// MEMORIA RAM 1X8
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram1x8.v"

module teste;
clock clk ( clok );
reg clr, adr, rw;
reg [7:0] in;
wire [7:0] s;
ram1x8 r1 (s, adr, clok, rw, clr, in);

initial begin
adr = 1; rw = 0; clr = 0;
in = 8'b01100101;
#12
$monitor ("Tempo %d -> Valor Guardado --> %b, %b, %b, %b, %b, %b, %b, %b", $time, s[7], s[6], s[5], s[4], s[3], s[2], s[1], s[0]);
$dumpfile ( "Exercicio03.vcd" );
$dumpvars;
rw = 1;
#5
rw = 0;
#5
adr = 0;
#5
adr = 1;
#50
in = 8'b11110110;
#5
rw = 1;
#5
rw = 0;
#5
adr = 0;
#10
adr = 1;
#10
adr = 0;
#10
adr = 1;
#10
adr = 0;
#10
adr = 1;
#10
adr = 0;
#500 $finish;
end
endmodule