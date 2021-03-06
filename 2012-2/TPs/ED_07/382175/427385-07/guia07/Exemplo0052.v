// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Mealy FSM 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// -------------------- 
// --- Mealy FSM 
// -------------------- 
`include "Mealy1001.v" 

module Exemplo0052;
	reg clk, reset, x; 
   wire m1; 

   mealy1001 mealy1 ( m1, x, clk, reset ); 

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

endmodule
// -- Exemplo0052
// -- Time  X  Mealy
// --   10    0    0
// --   20    1    0
// --   30    0    0
// --   40    1    0
// --   50    1    0
// --   60    0    0
// --   70    1    0
// --   80    0    0
// --   90    0    0
// --  100    1    1
// --  110    0    0
// --  120    0    0
// --  130    1    1
// --  140    1    0
// --  150    1    0