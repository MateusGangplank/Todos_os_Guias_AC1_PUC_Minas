// -------------------------
// Guia 06 - Exemplo0041.v
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
	
// ------------------------
// Modulo Exemplo0041.v
// ------------------------
	
module Exemplo0041;
wire  clk;
clock CLK1 ( clk );

initial begin
  $display ("Exemplo0041.v - Wender Zacarias Xavier - 427472");
  $display ("Test Clock Generator");
  $dumpfile ( "Exemplo0041.vcd" );
  $dumpvars;
  
#120 $finish;
end

endmodule // Exemplo041 ( 
