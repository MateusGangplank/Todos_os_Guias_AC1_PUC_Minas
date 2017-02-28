// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Moore FSM 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

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

endmodule
// -- Exemplo0053
// -- Time  X  Moore
// --  10    0     0
// --  20    1     0
// --  30    0     0
// --  40    1     0
// --  50    1     0
// --  60    0     0
// --  70    1     0
// --  80    0     0
// --  90    0     0
// -- 100    1     0
// -- 110    0     1
// -- 120    0     0
// -- 130    1     0
// -- 140    1     0
// -- 150    1     0
 
