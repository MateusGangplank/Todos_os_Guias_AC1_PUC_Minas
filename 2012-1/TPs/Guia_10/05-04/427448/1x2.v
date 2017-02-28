// -------------------------
// Memória RAM 1x2 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// --------------------------- 
// --- Memória RAM 1x2 
// --------------------------- 
   
	`include "1x1.v"

// ------------------------------- 

		 module Mem_1por2 (output [1:0]saida, input [1:0]entrada, input clk, input addr, input rw, input clr);
		
         Mem_1por1 MEM1 (saida[0], entrada[0], clk, addr, rw, clr);
		   Mem_1por1 MEM2 (saida[1], entrada[1], clk, addr, rw, clr);
		  
       endmodule // Mem_1por2
	 
	