// -----------------------------------------
// - Guia 09 - Wender Zacarias Xavier - 427472
// - Clock.v
// - Ci�ncia da Computa��o - 2�Per�odo
// ----------------------------------------- 

// -----------------------------------------
// Clock Generator
// -----------------------------------------
// -- modulo Clock

	module clock(clk);
		output clk;
		reg clk;
		
		initial
			begin
			clk = 1'b0;
			end
			
		always
			begin
			#4 clk = ~clk;
			end
			
	endmodule //clock