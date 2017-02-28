// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Clock
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 
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
endmodule