//-- Arquitetura de Computadores --
//-------- Miller - 449048 --------
//--------- Flip Flop T -----------

module FFT ( output q, output qnot, 
             input t, input clk, 
             input preset, input clear ); 
reg q, qnot;
 
always @( posedge clk or posedge clear or posedge preset )

	begin 
		if ( clear ) 
		begin 
			q = 0; qnot = 1; 
		end
		
		else 
		if ( preset ) 
		begin 
			q = 1; qnot = 0; 
		end
		 
		else 
		if ( t ) 
		begin 
			q <= ~q; qnot <= ~qnot; 
		end 
		
	end
	
endmodule // FFT 