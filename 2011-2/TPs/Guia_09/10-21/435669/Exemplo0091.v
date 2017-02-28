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
01.) Projetar e descrever em Verilog um módulo, 
com portas e flip-flops tipo T apenas, 
para implementar um contador assíncrono decrescente. 
DICA: Ver modelo anexo. 
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
	q <= 0; qnot <= ~q; 
end 
	else 
		if ( ~preset ) 
	begin 
		q <= 1; qnot <= ~q; 
end 
	else 
	begin 
		if ( t ) 
	begin 
		q <= ~q; qnot <= ~q; 
		end 
	end 
end 

endmodule // flip_floop_t

//-----------------------------------
//-- Contador Assincrono Decrescente
//-----------------------------------
module decrescente(output[3:0]sq, input t, input clk, input preset, input clear);

wire sqnot;

flip_floop_t t0(sq[0], sqnot, t, clk, preset, clear);
flip_floop_t t1(sq[1], sqnot, t, sq[0], preset, clear);
flip_floop_t t2(sq[2], sqnot, t, sq[1], preset, clear);
flip_floop_t t3(sq[3], sqnot, t, sq[2], preset, clear);

endmodule //decrescente

//--------------
//-- Exemplo0091
//--------------

module Exemplo0091;

wire clk;
wire [3:0] s;
reg clear, preset;
reg t;

clock Clk1(clk);
decrescente c1(s, t, clk, preset, clear);

//-----teste-----
initial begin
#1 clear = 0; t =1; preset = 1;

      $display("Nome: Mateus Augusto Moraes Ferreira  Matricula: 435669");
		$display("CLK SAIDA T CLR");
		$monitor("%1b   %5b %1b  %1b", clk, s, t, clear);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#100 $finish;
	end

endmodule //Exemplo0091