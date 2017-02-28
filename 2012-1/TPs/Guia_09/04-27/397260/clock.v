module clock ( clk ); 
output clk; 
reg clk; 
initial 
begin 
clk = 1'b0; 
end 
always 
begin 
#6 clk = ~clk; 
end 
endmodule // clock ( )
