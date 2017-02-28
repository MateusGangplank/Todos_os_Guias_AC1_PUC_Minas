// -------------------------
// Exercicio01 Guia 10
// MEMORIA RAM 1X4
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//`include "Clock.v"
`include "FlipFlopJK.v"
module ram1x4 (output [3:0] s,
input adr, input clk, input rw, input clr, input [3:0]data);
reg [3:0] s;
wire [3:0] q;
wire [3:0] qnot;
wire clock;
and (clock, adr, clk, rw);
jkff j1 (q[0], qnot[0], data[0], ~data[0], clr, clock);
jkff j2 (q[1], qnot[1], data[1], ~data[1], clr, clock);
jkff j3 (q[2], qnot[2], data[2], ~data[2], clr, clock);
jkff j4 (q[3], qnot[3], data[3], ~data[3], clr, clock);

always @ ( clock )
begin
if (clr)
begin
s <= 4'b0;
end
else
begin
s <= q;
end
end
endmodule // ram 1x4