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
05.) Projetar e descrever em Verilog um módulo, 
com portas e flip-flops tipo JK apenas, 
para implementar um contador módulo 6. 
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
//-- FLIP FLOOP TIPO JK
//---------------------

module flip_floop_jk ( output q, output qnot, input j, input k, input clk, input clear ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
		if( clear )
		   begin
			q = 0;
			qnot = ~q;
		   end
		else 
			begin
			if ( j & ~k ) //set
				begin 
				q = 1;
				qnot = 0; 
				end 
			else if ( ~j & k ) //reset
				begin 
				q = 0;
				qnot = 1; 
				end 
			else if ( j & k ) //toogle
				begin 
				q = ~q;
				qnot = ~qnot; 
				end 
		end
	end 
endmodule // flip_floop_jk

//-----------------------------------
//-- Contador
//-----------------------------------

module contador (output [2:0] s, input clk, input clear);

wire qnot0, qnot1, qnot2, a, c;
wire clk0, clk1, clk2;

and AND1 (a, ~s[0], s[1], s[2]);
or OR1 (c, clear, a);
or ORC0 (clk0, c, clk);
or ORC1 (clk1, c, qnot0);
or ORC2 (clk2, c, qnot1);

flip_floop_jk jk0(s[0], qnot0, clk0, clk0, clk0, c);
flip_floop_jk jk1 (s[1], qnot1, clk1, clk1, clk1, c);
flip_floop_jk jk2 (s[2], qnot2, clk2, clk2, clk2, c);

endmodule //contador

//--------------
//-- Exemplo0095
//--------------

module Exemplo0095;

	reg clear;
	wire clk;
	wire [2:0] saida;
	
	clock CLK1 (clk);
	contador cont1 (saida, clk, clear);
	
	initial begin
		#1 clear = 1;
		
		$display("Nome: Mateus Augusto Moraes Ferreira  Matricula: 435669");
		$display("CLK SAIDA CLEAR");
		$monitor("%1b    %3b    %1b", clk, saida, clear);
		
		#10 clear = 0;
		#100 $finish;
	end
endmodule //Exemplo0095