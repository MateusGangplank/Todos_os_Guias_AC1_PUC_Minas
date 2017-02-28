 // ------------------------- 
// Clock 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
module clock ( clk ); 
output clk; 
reg clk; 

// ------------------------- parte principal 
initial 
begin 
clk = 1'b0; 
end
 
always 
begin 
#12 clk = ~clk; 
end 

endmodule // clock ( ) 