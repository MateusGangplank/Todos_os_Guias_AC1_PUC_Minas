//-- Arquitetura de Computadores --
//-------- Miller - 449048 --------
//--------- Flip Flop JK ----------

module FFJK ( output q, output qnot, input j, input k,
              input clock, input preset, input clear ); 
reg q, qnot;

always @(posedge clock or posedge clear)

	begin
	
		if(clear)
		begin
			q = 0;	qnot = 1;
		end
		
		else if(preset)
		begin
			q = 1;	qnot = 0;
		end

		else if ( j & ~k ) 
		begin 
			q <= 1;	qnot <= 0; 
		end
		 
		else if ( ~j & k ) 
		begin 
			q <= 0;	qnot <= 1; 
		end 

		else if ( j & k ) 
		begin 
			q <= ~q;	qnot <= ~qnot; 
		end
	
	end
		
endmodule //Fim do Flip Flop JK