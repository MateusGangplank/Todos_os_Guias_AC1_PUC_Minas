// -------------------------
// Exercicio04 Guia 10
// DEMUX 2X4 - 4 BITS
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------


module demux ( output [3:0]s, input [1:0] selec, input x );
reg [3:0]s;
always @ ( s or selec or x )
begin
if ( selec == 00 )
begin
s <= 4'b0001;
end
else
if ( selec == 01 )
begin
s <= 4'b0010;
end
else
if ( selec == 10 )
begin
s <= 4'b0100;
end
else 
if ( selec == 11 )
begin
s <= 4'b1000;
end
end
endmodule