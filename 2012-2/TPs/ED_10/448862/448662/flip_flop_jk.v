// ---------------
// Flip - Flop JK - Síncrono- Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 08/10/2012
// ----------------

module flip_flop_jk ( output q, output qnot, input j, input k, input clk, input preset, input clear);

reg q, qnot;
always @( posedge clk )
begin
if ((clear) | ( ~j & k )) //Reseta
begin
q <= 0; qnot <= 1;
end
else if ((j & ~k) | (preset))  //Seta
begin
q <= 1; qnot <= 0;
end
else
if ( j & k )  // Toogle
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // flip_flop_jk
