// -----------------------------
// FLIP FLOP - D
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
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