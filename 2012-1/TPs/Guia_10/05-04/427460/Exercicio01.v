// -------------------------
// Exercicio001 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ---------------------------


	module jkff ( output q, output qnot, 
	input j, input k, input clr, input clk ); 
		
		reg q, qnot; 
			always @( posedge clk  or  posedge clr ) 
			
			begin 
			if(clr)
			begin
			 q = 0;
			 qnot = 1;
			end
			
			if ( j & ~k ) 
			begin 
			q <= 1; qnot <= 0; 
			end 
			else 
			
			if ( ~j & k ) 
			begin 
			q <= 0; qnot <= 1; 
			end 
			
			else 
			if ( j & k ) 
				begin 
				 q <= ~q; qnot <= ~qnot; 
			end 
		end 
		endmodule // jkff 
		
//-----------------------------------
//--- RAM 1x4
//-----------------------------------		
		
		module Exercicio01(output [3:0]saida, input [3:0]inp, input clk, input addr, input rw,  input clr );
	
		
		wire s1;
		wire [3:0]s; 
		wire [3:0]snot; 
		
		and AND1(s1, addr, rw, clk);
		
		jkff a1(s[0], snot[0], inp[0], ~inp[0], clear, s1);
		jkff a2(s[1], snot[1], inp[1], ~inp[1], clear, s1);
		jkff a3(s[2], snot[2], inp[2], ~inp[2], clear, s1);
		jkff a4(s[3], snot[3], inp[3], ~inp[3], clear, s1);		
		
		
		and AND2(saida[0], addr, s[0]);
 		and AND3(saida[1], addr, s[1]);
		and AND4(saida[2], addr, s[2]);
		and AND5(saida[3], addr, s[3]);
		
endmodule
		
// ------------------------- 
// -- teste
// -------------------------
    
	  module teste_Exercicio01; 

// ------------------------- definir dados 
    
	  reg [3:0]entrada;
	  reg clk;
	  reg addr;
	  reg rw;
	  reg clr; 
	  wire [3:0]saida;
	 
// ------------------------- instancia 
	 
     Exercicio01 mod1 (saida, entrada, clk, addr, rw, clr);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
		 #1 entrada = 1110;  clk = 0;  addr = 0;  rw = 0;  clr = 1;
		$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
		 #1 entrada = 1110;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
		 

     end		 
	endmodule 
			 