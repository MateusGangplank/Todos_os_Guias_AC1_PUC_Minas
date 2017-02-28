// --------------------------- 
// -- Fabio Fiuza Pereira
// --  406087
// --------------------------- 

//--CLOCK

module clock ( clock ); 
	output clock; 
	reg clock; 
	initial 
		begin 
		clock = 1'b0; 
		end 
	always 
		begin 
		#5 clock = ~clock; 
		end 
endmodule // 