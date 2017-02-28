// -------------------------
// Exercicio03 Guia 10
// MEMORIA RAM 1X8
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram1x4.v"
`include "mux.v"

module ram1x8(output [7:0] s,
input adr, input clk, input rw, input clr, input [7:0]data);
reg [7:0] s;
wire [3:0] stmp;
wire [3:0] stmp1;
wire x;

ram1x4 r1 (stmp, adr, clk, rw, clr, data[3:0]);
ram1x4 r2 (stmp1, adr, clk, rw, clr, data[7:4]);
always @ (posedge clk )
begin
if ( clr )
begin
s <= 8'b0;
end
else if ( adr )
begin
s[7:4] <= stmp1;
s[3:0] <= stmp;
end
end
endmodule