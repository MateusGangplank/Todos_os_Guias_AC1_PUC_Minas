// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Mealy FSM 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// -------------------- 
// --- Mealy FSM 
// -------------------- 

  `include "Mealyx000.v" 
 
  module Exemplo0055; 
   reg clk, reset, x; 
   wire m1; 

   mealyx000 mealy1 ( m1, x, clk, reset ); 

  initial 
   begin 
    $display ( "Time  X  Mealy " );
	  
// initial values 
   clk = 1; 
   reset = 0; 
   x = 0; 

// input signal changing  
   #5 reset = 1; 
   #10 x = 1; 
   #10 x = 0; 
   #10 x = 1; 
   #20 x = 1; 
   #10 x = 0; 
   #10 x = 0; 
   #10 x = 0; 
   #10 x = 0; 
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

endmodule
// -- Exemplo0055
// -- Time  X  Mealy
// --   10    0    0
// --   20    1    0
// --   30    0    0
// --   40    1    0
// --   50    1    0
// --   60    1    0
// --   70    0    0
// --   80    0    0
// --   90    0    1
// --  100    0    0
// --  110    0    0
// --  120    0    1
// --  130    1    0
// --  140    1    0
// --  150    1    0
