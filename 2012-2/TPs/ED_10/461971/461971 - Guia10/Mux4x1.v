// -------------------------
// Exercicio04 Guia 10
// MUX 4X1 - 4 BITS
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------


module mux ( output [3:0]s, input[3:0]d1, input[3:0]d2, input [3:0] d3, input [3:0] d4, input [1:0] selec );
reg [3:0]s;
always @ (d1 or d2 or d3 or d4 or selec)
begin
if ( selec == 00 )
begin
s <= d1;
end
else
if ( selec == 01 )
begin
s <= d2;
end
else
if ( selec == 10 )
begin
s <= d3;
end
else 
if ( selec == 11 )
begin
s <= d4;
end
end
endmodule