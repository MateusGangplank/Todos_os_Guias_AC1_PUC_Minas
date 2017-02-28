// Nome: Jonatas Sena Ferreira
// Matricula: 427424

module clock ( output clk ); 
reg clk; 
initial begin 
clk = 1'b0; 
end 

always 
begin 
#12 clk = ~clk; 
end 

endmodule // clock 