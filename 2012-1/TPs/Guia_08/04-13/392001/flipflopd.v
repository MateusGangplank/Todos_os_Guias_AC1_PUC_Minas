// -----------------------------
// FLIP FLOP - D
// Nome: Flávio Andrade Amaral Motta
// Matricula: 392001
// -----------------------------

// -------------------------
// -- FLIP FLOP D
// -------------------------
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
		q <= d;
		qnot <= ~q;
	end
endmodule // dff 