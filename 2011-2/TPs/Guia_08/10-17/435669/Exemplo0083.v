/*
----------------------------------------------------
PUC-Minas - Ci�ncia da Computa��o 
ARQ1 � Guia 08 
Per�odo: 26-30/09/2011 
Nome: Mateus Augusto Moraes Ferreira
Matricula: 435669
---------------------------------------------------- 
Tema: Introdu��o � linguagem Verilog 
Atividade: Circuitos sequenciais � Flip-Flops 
Todos os circuitos dever�o ser simulados no Logisim. 
---------------------------------------------------- 
03.) Projetar e descrever em Verilog um m�dulo 
para implementar um registrador de deslocamento 
circular para a direita, com 5 bits (est�gios),  
com carga unit�ria no primeiro est�gio. 
----------------------------------------------------
*/
//------------
// Flip Floop
//------------

module flip_floop_D(output q,input d, input clk); 
	reg q, qnot;
	always @( posedge clk )
  	begin
 		q <= d;
  		qnot <= ~q;
	end

endmodule // flip_floop_D

module Exemplo0083;
reg clk;
reg data;
wire [4:0] q;

flip_floop_D d1(q[4],data,clk);
flip_floop_D d2(q[3],q[4],clk);
flip_floop_D d3(q[2],q[3],clk);
flip_floop_D d4(q[1],q[2],clk);
flip_floop_D d5(q[0],q[1],clk);

initial begin

// initial values 
clk = 1; 
data = 0; 
// input signal changing 

#10 data = 1; 
#10 data = 0; 
#10 data = 1; 
#20 data = 0; 
#10 data = 1; 
#10 data = 1; 
#10 data = 0; 
#10 data = 1; 
#30 $finish; 
end // initial 

always 
#5 clk = ~clk; 
always @( posedge clk ) 

	begin 
		$display ( "%4d %4b   %5b", $time, data, q ); 
	end 
endmodule // Exemplo0083