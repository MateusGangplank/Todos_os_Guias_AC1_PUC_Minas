// -------------------------
// Exercicio002 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ---------------------------

	
	`include "Exercicio01.v" 
// ------------------------------- 
    
	 module Mux (output saida, input ent1, input ent2, input chave);
		
		wire [1:0] s;
		wire snot;
		
        not NOT0 (snot, chave);
		  and AND0 (s[0], ent1, snot);
		  and AND1 (s[1], ent2, chave);  
		  or OR0 (saida, s[0], s[1]);
		  		  
       endmodule // Mux
		 
// -------------------------------

     module Demux (output saida0, output saida1, input chave);
		
		wire snot;
		
        not NOT0 (snot, chave);
		  and AND0 (saida0, 1, snot);
		  and AND1 (saida1, 1, chave);  
		  		  
       endmodule // Demux 	


		
//-----------------------------------
//--- RAM 2x4
//-----------------------------------		
		
		module Exercicio02(output [3:0]saida, input [3:0]inp, input clk, input addr, input rw,  input clr );
				
		wire s1, s2;
		wire [3:0]saida1; 
		wire [3:0]saida2; 
		
			
		Demux dmx (s1,s2, addr);
		
		Exercicio01 mem1(saida1, inp, clk, s1, rw, clr);
		Exercicio01 mem2(saida2, inp, clk, s2, rw, clr);	
		
		Mux MUX1 (saida[0], saida1[0], saida2[0], addr);
		Mux MUX2 (saida[1], saida1[1], saida2[1], addr);
		Mux MUX3 (saida[2], saida1[2], saida2[2], addr);
		Mux MUX4 (saida[3], saida1[3], saida2[3], addr);
		
endmodule	

// ------------------------- 
// -- teste
// -------------------------
    
	  module teste_Exercicio02; 

// ------------------------- definir dados 
    
	  reg [3:0]entrada;
	  reg clk;
	  reg addr;
	  reg rw;
	  reg clr; 
	  wire [3:0]saida;
	 
// ------------------------- instancia 
	 
     Exercicio02 mod1 (saida, entrada, clk, addr, rw, clr);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
		 #1 entrada = 1110;  clk = 1;  addr = 0;  rw = 1;  clr = 1;
		$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
		 #1 entrada = 1101;  clk = 0;  addr = 1;  rw = 1;  clr = 0;
		 #1 entrada = 1100;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
		 

     end		 
	endmodule 
			 