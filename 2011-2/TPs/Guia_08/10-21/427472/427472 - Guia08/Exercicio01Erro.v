// -----------------------------------------
// - Guia 08 - Wender Zacarias Xavier - 427472
// - Exercicio01.v
// - Ciência da Computação - 2ºPeríodo
// ----------------------------------------- 

	module dff ( output q, output qnot,
               input   d, input clk,
					input clear);
	reg q;  reg qnot;

	always @( posedge clk )
	   begin
  	   q <= d;         qnot <= ~q; 
	   end 
	endmodule // dff
	
// ------------------------------------
// Registrador de deslocamento para a esquerda;
// ------------------------------------

	module rde;
	
	reg x, clock, clear;
	wire a,b,c,d,e,na,nb,nc,nd,ne,nf;
	
	dff RDE1 (a,na,b,clock,clear);
	dff RDE2 (b,nb,c,clock,clear);
	dff RDE3 (c,nc,d,clock,clear);
	dff RDE4 (d,nd,e,clock,clear);
	dff RDE5 (e,ne,x,clock,clear);
	
	initial begin
	
		x = 1;	clock = 0;	clear = 1;
	$display ("Exercicio01 - Guia08 - Teste");
	$display ("Aluno: Wender Zacarias Xavier - 427472");
	$monitor (" %b  %b  %b  %b  %b", a,b,c,d,e);
#1 clear = 0;	x = 1; clock = 1;
#1 x = 1;
#1 x = 1;
#1 x = 1;
#1 x = 0;
#1 x = 1;
#1 x = 0;
#1 x = 1;
#1 x = 1;
#1 clear = 1;
#1 clear = 0; x = 1;
#1 x = 1;

	end
	endmodule // Fim Exercicio01