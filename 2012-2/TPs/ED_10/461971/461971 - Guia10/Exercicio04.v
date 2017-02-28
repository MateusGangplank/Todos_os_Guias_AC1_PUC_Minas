// -------------------------
// Exercicio04 Guia 10
// MEMORIA RAM 4X8
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram4x8.v"

module teste;
clock clk ( clok );
reg clr, rw;
reg [1:0]adr;
reg [7:0] in;
wire [7:0] s;
ram4x8 r1 (s, adr, clok, rw, clr, in);

initial begin
adr = 0; rw = 0; clr = 0;
in = 8'b00000010;
#12
$monitor ("Tempo %d -> Address = %b, Valor --> %b, %b, %b, %b, %b, %b, %b, %b", $time, adr, s[7], s[6], s[5], s[4], s[3], s[2], s[1], s[0]);
$dumpfile ( "Exercicio04.vcd" );
$dumpvars;
#1
rw = 1;
#5
rw = 0;
#5
adr = 1;
in = 8'b00000110;
#5
rw = 1;
#5
rw = 0;
#5
adr = 2;
in = 8'b00000111;
#5
rw = 1;
#5
rw = 0;
#5
in = 8'b00000101;
adr = 3;
#5
rw = 1;
#5
rw = 0;
#5
adr = 1;
#5
adr = 0;
#10
adr = 3;
#10
adr = 2;
#500 $finish;
end
endmodule