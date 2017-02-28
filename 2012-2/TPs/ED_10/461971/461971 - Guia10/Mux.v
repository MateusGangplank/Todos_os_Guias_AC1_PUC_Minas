// -------------------------
// Exercicio02 Guia 10
// MUX 2X1 - 4 BITS
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------


module mux ( output [3:0]s, input[3:0]d1, input[3:0]d2, input selec );
reg [3:0]s;
always @ (selec or !selec)
begin
if ( selec )
begin
s <= d1;
end
else
begin
s <= d2;
end
end
endmodule