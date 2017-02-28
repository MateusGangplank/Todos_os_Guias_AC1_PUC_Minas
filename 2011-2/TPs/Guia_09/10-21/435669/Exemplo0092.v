/*
----------------------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Guia 09 
Período: 03-070/10/2011 
Nome: Mateus Augusto Moraes Ferreira
Matricula: 435669
----------------------------------------------------
Tema: Introdução à linguagem Verilog 
Atividade: Circuitos sequenciais – Flip-Flops 
Todos os circuitos deverão ser simulados no Logisim. 
 ----------------------------------------------------
02.) Projetar e descrever em Verilog um módulo 
com portas e flip-flops tipo T apenas, 
para implementar um contador assíncrono crescente  
----------------------------------------------------
*/


//---------------
//--  CLOCK
//---------------


module clock ( clk ); 	
output clk; 
reg clk; 

initial begin 
clk = 1'b0; 
end 

always begin 
#12 clk = ~clk; 
end 
endmodule // clock


//---------------------
//-- FLIP FLOOP TIPO T
//---------------------

module flip_floop_t ( output q, output qnot, 
					       input t, input clk, input preset, input clear ); 

	reg q, qnot;
 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
			begin 
				q = 0; qnot = ~q; 
	end 
		else 
			if ( ~preset ) 
				begin 
					q = 1; qnot = ~q; 
		end
			else 
				begin 
					if ( t ) 
						begin 
							q = ~q; qnot = ~q; 
					end
				end 
			end


endmodule // flip_floop_t

//-----------------------------------
//-- Contador Assincrono Decrescente
//-----------------------------------
module decrescente(output[3:0]sq, input t, input clk, input preset, input clear);

wire [3:0] sqnot;

flip_floop_t t0 (sq[0], sqnot[0], t, clk, preset, clear);
flip_floop_t t1 (sq[1], sqnot[1], t, sqnot[0], preset, clear);
flip_floop_t t2 (sq[2], sqnot[2], t, sqnot[1], preset, clear);
flip_floop_t t3 (sq[3], sqnot[3], t, sqnot[2], preset, clear);

endmodule //decrescente

//--------------
//-- Exemplo0092
//--------------

module Exemplo0092;

wire clk;
wire [3:0] s;
reg t, clear, preset;


clock Clk1(clk);
decrescente c1(s, t, clk, preset, clear);

//-----teste-----
initial begin
		#1 clear = 0; t = 1; preset = 1;
		
		$display("Nome: Mateus Augusto Moraes Ferreira  Matricula: 435669");
		$display("CLK SAIDA T");
		$monitor("%1b   %5b %1b", clk, s, t);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#100 $finish;
	end

endmodule //Exemplo0092