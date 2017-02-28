//-------------------------------------
// flip - Flops D, JK, SR, T
// Nome: Alvaro Henrique de Araujo Rungue
// Matrícula: 395487
//-------------------------------------

`include "clock.v"

module ffT ( output q , output qnot ,	input t , input clk , input preset , input clear ); 

	//-- Registradores
	reg q, qnot; 

	always @( posedge clk or posedge preset or posedge clear) 
	begin 
		if (clear ) 
		begin 
			q = 0; qnot = 1; 
		end 
		else if (preset) 
		begin 
			q = 1; qnot = 0; 
		end 
		else 
		begin 
			if ( t ) 
			begin 
				q <= ~q; qnot <= ~qnot; 
			end 
		end 
	end 
endmodule //-- ffT 

module ffJK ( output q, output qnot , input j , input k , input clk , input preset , input clear ); 
	
	//-- Registradores
	reg q, qnot;

	always @(posedge clk or posedge preset or posedge clear)
	begin
		if(clear)
		begin
			q = 0;
			qnot = 1;
		end
		else if(preset)
		begin
			q = 1;
			qnot = 0;
		end
		else if ( j & ~k ) 
		begin 
			q <= 1; qnot <= 0; 
		end 
		else if ( ~j & k ) 
		begin 
			q <= 0; qnot <= 1; 
		end 
		else if ( j & k ) 
		begin 
			q <= ~q; qnot <= ~qnot; 
		end
	end
endmodule //-- ffJK 