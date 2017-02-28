// -------------------------
// Exercicio02 Guia 10
// MEMORIA RAM 2X4
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram2x4.v"

module teste;
clock clk ( clok );
reg clr, adr, rw;
reg [3:0] in;
wire [3:0] s;
ram2x4 r1 (s, adr, clok, rw, clr, in);

initial begin
adr = 0; rw = 0; clr = 0;
in = 4'b0101;
#12
$monitor ("Tempo %d -> Address = %b, Valor --> %b, %b, %b, %b", $time, adr, s[3], s[2], s[1], s[0]);
$dumpfile ( "Exercicio02.vcd" );
$dumpvars;
adr = 1;
#1
rw = 1;
#5
rw = 0;
#5
adr = 0;
#5
adr = 1;
#50
in = 4'b1011;
adr = 0;
#5
rw = 1;
#5
rw = 0;
adr = 1;
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