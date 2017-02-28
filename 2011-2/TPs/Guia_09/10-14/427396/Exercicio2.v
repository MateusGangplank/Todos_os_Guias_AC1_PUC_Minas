// ------------------------- 
// Guia 09 -Exercicio2
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule // clock ( )

// -------------------------
// -- FLIP FLOP T
// -------------------------
module tff ( output q, output qnot, input t, input clk, input preset, input clear ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
			begin 
			q = 0;
			qnot = ~q; 
			end 
		else 
			if ( ~preset ) 
				begin 
				q = 1;
				qnot = ~q; 
				end 
			else 
				begin 
				if ( t ) 
					begin 
					q = ~q;
					qnot = ~q; 
			end 
		end 
	end 
endmodule // tff 

// -------------------------
// -- Contador assíncrono crescente - 5bits
// -------------------------
module ContAssinCre (output [4:0] s, input t, input clk, input present, input clear);
	wire qnot, qnot1, qnot2, qnot3, qnot4;
	
	tff TFF0 (s[0], qnot, t, clk, present, clear);
	tff TFF1 (s[1], qnot1, t, qnot, present, clear);
	tff TFF2 (s[2], qnot2, t, qnot1, present, clear);
	tff TFF3 (s[3], qnot3, t, qnot2, present, clear);
	tff TFF4 (s[4], qnot4, t, qnot3, present, clear);
	
endmodule //AssincronoDec

// -------------------------
// -- Exercicio2
// -------------------------
module Exercicio2;
	reg clear, t, present;
	wire clk;
	wire [4:0] saida;
	
	clock CLK1 (clk);
	ContAssinCre CNT1 (saida, t, clk, present, clear);
	initial begin
		#1 clear = 0; t = 1; present = 1;
		
		$display("CLK SAIDA T CLR PST");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, saida, t, clear, present);
		
		#24 clear = 1; present = 0;
		#24 present = 1;
		#960 $finish;
	end

endmodule //Exercicio2