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
03.) Projetar e descrever em Verilog um módulo, 
com portas e flip-flops tipo T apenas, 
para implementar um contador decádico decrescente. 
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
wire[2:0] clk1;

not n1(nt, t);
and a1(a, sqnot[0], ~sqnot[1], ~sqnot[2], sqnot[3]);
nor n1(clear, a, nt);

xor x1(clk1[0], sq[0], ~clear);
xor x2(clk1[1], sq[1], ~clear);
xor x3(clk1[2], sq[2], ~clear);


flip_floop_t t0(sq[0], sqnot[0], t, clk, preset, clear);
flip_floop_t t1(sq[1], sqnot[1], t, clk1[0], preset, clear);
flip_floop_t t2(sq[2], sqnot[2], t, clk1[1], preset, clear);
flip_floop_t t3(sq[3], sqnot[3], t, clk1[2], preset, clear);

endmodule //decrescente

//--------------
//-- Exemplo0093
//--------------

module Exemplo0093;

wire clk;
wire [3:0] s;
reg t, preset;

clock Clk1(clk);
DecadicoDecrescente dd1(s, t, clk, preset);

//-----teste-----
initial begin
		#1 t = 1; preset = 0;
		
		$display("Nome: Mateus Augusto Moraes Ferreira  Matricula: 435669");
		$display("CLK SAIDA T");
		$monitor("%1b   %4b %1b", clk, s, t);
		
		#24 preset = 1;
		#220 $finish;
	end

endmodule //Exemplo0093