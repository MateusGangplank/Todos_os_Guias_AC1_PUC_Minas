// ------------------------- 
// Mealy FSM 
// Nome: Lucas SIqueira Chagas 
// Matricula: 380783
// -------------------------

// -------------------- 
// --- Mealy FSM 
// -------------------- 

  `include "Mealy1010.v" 
 
  module Exemplo0052; 
   reg clk, reset, x; 
   wire m1; 

   mealy1101 mealy1 ( m1, x, clk, reset ); 

  initial 
   begin 
    $display ( "Time  X  Mealy" );
	  
// initial values 
   clk = 1; 
   reset = 0; 
   x = 0; 

// input signal changing  
   #5 reset = 1; 
   #10 x = 1; 
   #10 x = 0; 
   #10 x = 1; 
   #20 x = 0; 
   #10 x = 1; 
   #10 x = 0; 
   #10 x = 0; 
   #10 x = 1; 
	#10 x = 0; 
   #10 x = 0; 
   #10 x = 1; 

   
	#30 $finish; 
   end // initial 

always 
   #5 clk = ~clk; 

always @( posedge clk ) 
 begin 
  $display ( "%4d %4b %4b", $time, x, m1); 
end // always at positive edge clocking changing 

endmodule // Exemplo0052 
