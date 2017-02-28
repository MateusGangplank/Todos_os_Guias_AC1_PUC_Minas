// ---------------
// Flip - Flop T - Assíncrono- Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 30/09/2012
// ----------------

module flip_flop_t_ass( output q, output qnot, input t, input clk, input clear, input preset);

reg q, qnot;

// Definição dos estágios do flip flop
always @( posedge clk )
begin
if ( ~clear )
begin
q <= 0; qnot <= 1;
end
else
if ( ~preset )
begin
q <= 1; qnot <= 0;
end
else
begin
if ( t )
begin
q <= ~q; qnot <= ~qnot;
end
end
end

endmodule // flip_flop_t

