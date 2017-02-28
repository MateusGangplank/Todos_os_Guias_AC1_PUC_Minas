// -------------------------
// Memória RAM 1x4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// --------------------------- 
// --- Memória RAM 1x4 
// --------------------------- 
   
	`include "1x2.v"

// ------------------------------- 

		 module Mem_1por4 (output [3:0]saida, input [3:0]entrada, input clk, input addr, input rw, input clr);
		
         Mem_1por2 MEM1 (saida[1:0], entrada[1:0], clk, addr, rw, clr);
		   Mem_1por2 MEM2 (saida[3:2], entrada[3:2], clk, addr, rw, clr);
		  
       endmodule // Mem_1por4
		 
// ------------------------- 
// -- test Mem_1por4
// -------------------------
    
	  module test_Mem_1por4; 

// ------------------------- definir dados 
    
	  reg [3:0]entrada;
	  reg clk;
	  reg addr;
	  reg rw;
	  reg clr; 
	  wire [3:0]saida;
	 
// ------------------------- instancia 
	 
     Mem_1por4 modulo (saida, entrada, clk, addr, rw, clr);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Memória RAM 1x4 \n");
      $display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
		 #1 entrada = 1100;  clk = 0;  addr = 0;  rw = 0;  clr = 1;
		$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
		 #1 entrada = 1100;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
		 #1 entrada = 0000;  clk = 0;  addr = 1;  rw = 0;  clr = 0;

     end		 
	endmodule // Mem_1por4 
			 
		 
