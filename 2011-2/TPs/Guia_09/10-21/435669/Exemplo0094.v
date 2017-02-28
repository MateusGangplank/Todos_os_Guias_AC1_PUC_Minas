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
04.) Projetar e descrever em Verilog um módulo 
com portas e flip-flops tipo T apenas, 
para implementar um contador decádico crescente    
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
module DecadicoDecrescente(output[3:0]sq, input t, input clk, input preset);

wire [3:0] sqnot;
wire clear, nt, a;
wire clk1 [3:0];

not n1 (nt, t);

and a1(a, ~sq[0], sq[1], ~sq[2], sq[3]);
or or1(clear, a, nt);
or o0(clk1[0], clk, ~clear);
or o1(clk1[1], sqnot[0], ~clear);
or o2(clk1[2], sqnot[1], ~clear);
or o3(clk1[3], sqnot[2], ~clear);


flip_floop_t  t0 (sq[0], sqnot[0], t, clk1[0], preset, clear);
flip_floop_t  t1 (sq[1], sqnot[1], t, clk1[1], preset, clear);
flip_floop_t  t2 (sq[2], sqnot[2], t, clk1[2], preset, clear);
flip_floop_t  t3 (sq[3], sqnot[3], t, clk1[3], preset, clear);

endmodule //DecadicoDecrescente

//--------------
//-- Exemplo0094
//--------------

module Exemplo0094;

wire clk;
	wire [3:0] saida;
	reg t, preset;
	
	clock Clk1(clk);
	DecadicoDecrescente dd1 (saida, t, clk, preset);

//-----teste-----	
	initial begin
		#1 t = 0; preset = 0;
		
		$display("Nome: Mateus Augusto Moraes Ferreira  Matricula: 435669");
		$display("CLK SAIDA T");
		$monitor("%1b   %4b  %1b", clk, saida, t);
		
		#24 preset = 1; t=1;
		#268 $finish;
	end

endmodule //Exemplo0094
