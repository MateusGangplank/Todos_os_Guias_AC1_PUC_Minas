// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Mealy FSM 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// -------------------- 
// --- Mealy FSM 
// -------------------- 

  `include "Mealy1110.v" 
 
  module Exemplo0054; 
   reg clk, reset, x; 
   wire m1; 

   mealy1110 mealy1 ( m1, x, clk, reset ); 

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
   #10 x = 1; 
	#10 x = 1; 
   #10 x = 1; 
   #10 x = 0; 

	#30 $finish; 
   end // initial 

always 
   #5 clk = ~clk; 

always @( posedge clk ) 
 begin 
  $display ( "%4d %4b %4b", $time, x, m1); 
end // always at positive edge clocking changing 

endmodule
// -- Exemplo0054
// -- Time  X  Mealy
// --   10    0    0
// --   20    1    0
// --   30    0    0
// --   40    1    0
// --   50    1    0
// --   60    1    0
// --   70    0    1
// --   80    0    0
// --   90    0    0
// --  100    1    0
// --  110    1    0
// --  120    1    0
// --  130    0    1
// --  140    0    0
// --  150    0    0