// ------------------------- 
// FLIP FLOP - D
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

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