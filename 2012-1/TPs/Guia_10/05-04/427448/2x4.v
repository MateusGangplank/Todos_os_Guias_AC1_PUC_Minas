// -------------------------
// Memória RAM 2x4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// --------------------------- 
// --- Memória RAM 2x4 
// --------------------------- 
   
	`include "1x4.v"

// ------------------------------- 
    
	 module Mux (output saida, input entrada0, input entrada1, input chave);
		
		wire [1:0] s;
		wire saida_not;
		
        not NOT0 (saida_not, chave);
		  and AND0 (s[0], entrada0, saida_not);
		  and AND1 (s[1], entrada1, chave);  
		  or OR0 (saida, s[0], s[1]);
		  		  
       endmodule // Mux
		 
// -------------------------------

     module Demux (output saida0, output saida1, input chave);
		
		wire saida_not;
		
        not NOT0 (saida_not, chave);
		  and AND0 (saida0, 1, saida_not);
		  and AND1 (saida1, 1, chave);  
		  		  
       endmodule // Demux 	

// ------------------------------- 

		 module Mem_2por4 (output [3:0]OUT0, input [3:0]entrada, input clk, input addr, input rw, input clr);
		   wire [1:0]s;
			wire [3:0]saida0;
			wire [3:0]saida1;
		 
		   Demux demux0 (s[0], s[1], addr);
         Mem_1por4 MEM1 (saida0, entrada, clk, s[0], rw, clr);
		   Mem_1por4 MEM2 (saida1, entrada, clk, s[1], rw, clr);
   		Mux mux0(OUT0[0], saida0[0], saida1[0], addr);
			Mux mux1(OUT0[1], saida0[1], saida1[1], addr);
   		Mux mux2(OUT0[2], saida0[2], saida1[2], addr);
   		Mux mux3(OUT0[3], saida0[3], saida1[3], addr);
       endmodule // Mem_2por4
		 
// ------------------------- 
// -- test Mem_2por4
// -------------------------
    
	  module test_Mem_2por4; 

// ------------------------- definir dados 
    
	  reg [3:0]entrada;
	  reg clk;
	  reg addr;
	  reg rw;
	  reg clr; 
	  wire [3:0]saida;
	 
// ------------------------- instancia 
	 
     Mem_2por4 modulo (saida, entrada, clk, addr, rw, clr);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Memória RAM 2x4 \n");
      $display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
		 #1 entrada = 0001;  clk = 0;  addr = 0;  rw = 0;  clr = 1;
		$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
		 #1 entrada = 0000;  clk = 1;  addr = 0;  rw = 1;  clr = 0;
		 #1 entrada = 1000;  clk = 0;  addr = 0;  rw = 0;  clr = 0;
		 #1 entrada = 0000;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
		 #1 entrada = 0000;  clk = 0;  addr = 1;  rw = 0;  clr = 0;

     end		 
	endmodule // Mem_2por4 
			 
		 
