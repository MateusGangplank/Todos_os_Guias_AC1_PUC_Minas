// ------------------------- 
// Moore FSM 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// -------------------- 
// --- Moore FSM 
// -------------------- 

  `include "Moore1001.v"
 
  module Exemplo0053; 
   reg clk, reset, x; 
   wire m2; 

   moore1001 moore1 ( m2, x, clk, reset ); 

  initial 
   begin 
    $display ( "Time  X  Moore" );
	  
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
  $display ( "%4d %4b %5b", $time, x, m2 ); 
end // always at positive edge clocking changing 

endmodule // Exemplo0053 
