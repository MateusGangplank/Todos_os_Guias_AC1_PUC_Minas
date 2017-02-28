//-- Arquitetura de Computadores --
//-------- Miller - 449048 --------
//--------- Clock ----------

module Clock ( clk ); 
output clk; 
reg clk;

	initial 
		begin 
			clk = 1'b0; 
		end 

	always 
		begin 
			#5 clk = ~clk; 
		end

endmodule // Fim do Clock.