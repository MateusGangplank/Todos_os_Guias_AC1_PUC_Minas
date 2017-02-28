// -------------------------
// Guia 06 - Clock.v
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

// --------------------------- 
// -- Clock generator 
// --------------------------- 

    module clock ( clk ); 
    output clk; 
    reg     clk; 

    initial 
    begin 
      clk = 1'b0; 
    end 

    always 
     begin 
#12 clk = ~clk; 
     end 

   endmodule // clock ( ) 
	