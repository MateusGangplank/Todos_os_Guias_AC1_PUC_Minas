// ------------------------- 
// Mealy - 1101
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 
// -------------- 
// --- Mealy FSM 
// -------------- 
// constant definitions 
	`define found 1 
	`define notfound 0 
// FSM by Mealy 
module mealy1101 ( y, x, clk, reset ); 
	output y; 
	input x; 
	input clk; 
	input reset; 
	reg y; 
	
	parameter // state identifiers 
		start = 2'b00, 
		id1 = 2'b01, 
		id11 = 2'b11, 
		id110 = 2'b10; 
		reg [1:0] E1; // current state variables 
		reg [1:0] E2; // next state logic output 
	// next state logic 
	always @( x or E1 ) 
		begin 
		y = `notfound; 
		case ( E1 ) 
			start: 
			if ( x ) 
				E2 = id1; 
			else 
				E2 = start; 
			
			id1: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = start; 
			
			id11: 
			if ( x ) 
				E2 = id11; 
			else 
				E2 = id110; 
			
			id110: 
			if ( x ) 
			begin 
				E2 = id1; 
				y = `found; 
			end 
			else 
			begin 
				E2 = start; 
				y = `notfound; 
			end 
			
			default: // undefined state 
				E2 = 2'bxx; 
		
		endcase 
	end // always at signal or state changing 
	
	// state variables 
	always @( posedge clk or negedge reset ) 
		begin 
		if ( reset ) 
		E1 = E2; // updates current state 
		else 
		E1 = 0; // reset 
	end // always at signal changing 
endmodule // mealy1101 

/*
O que eu entendi....
	A m�quina de estados de MEALY consiste em
	receber o bit numerico e conferir se ele � o bit
	necess�rio para ir ao pr�ximo est�gio, caso n�o seja
	pode-mos optar por manter o est�gio atual intacto ou voltar
	a um anterior
	
	A m�qina s� mostrar� que o resultado foi encontrado
	somente se a sequ�ncia certa de bits entrar na ordem certa
*/