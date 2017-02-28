//--------------------
//Rafael Lopes Barbosa
//435052
//--------------------

//-------------
//--Clock
//-------------
module clock ( clk ); 
	output clk; 
	reg clk; 
		initial
		begin 
			clk = 1'b0; 
		end 
		
		always 
		begin 
		#12 clk = ~clk; 
		end
		 
endmodule // clk 

//---------------
//-- Flip Flop T
//---------------

module tff ( output q, output qnot, input t, input clk, input preset, input clear ); 
	
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
			 
endmodule // tff  

//---------------------------------
//--Contador Assìncrono Decrescente
//----------------------------------
module ContadorDecrescente (output [3:0] sq, input t, input clk, input preset, input clear);
	wire [3:0] sqnot;
	
	tff t0 (sq[0], sqnot[0], t, clk, preset, clear);
	tff t1 (sq[1], sqnot[1], t, sqnot[0], preset, clear);
	tff t2 (sq[2], sqnot[2], t, sqnot[1], preset, clear);
	tff t3 (sq[3], sqnot[3], t, sqnot[2], preset, clear);
	
endmodule // Contador Decrescente


//-----------
//--Exemplo02
//-----------
module Exemplo02;
	wire clk;
	wire [3:0] s;
	reg t, preset, clear;
	
	clock CLK1 (clk);
	ContadorDecrescente c1(s, t, clk, preset, clear);
	
	initial begin
		#1 clear = 0; t = 1; preset = 1;
		
		$display("CLK SAIDA T");
		$monitor("%1b   %5b %1b", clk, s, t);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#100 $finish;
	end

endmodule //Exemplo02