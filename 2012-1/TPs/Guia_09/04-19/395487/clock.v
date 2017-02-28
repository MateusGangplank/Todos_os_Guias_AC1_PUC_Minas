//-------------------------------------
// Clock
// Nome: Alvaro Henrique de Araujo Rungue
// Matrícula: 395487
//-------------------------------------



module clock(clk);
	output clk;
	reg clk;
	
	initial begin
		clk = 1'b0;
	end
	
	always
		begin
			#5 clk = ~clk;
		end
endmodule //-- clock