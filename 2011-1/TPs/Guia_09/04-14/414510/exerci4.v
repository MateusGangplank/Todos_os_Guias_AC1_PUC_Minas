//Marley Ribeiro
//414510



module pulse ( signal, clock ); 
	
	input clock; 
	output signal; 
	reg signal; 
	
always @ ( clock ) 
	begin 
		 signal = 1'b0; 
	# 48 signal = 1'b1; 
	# 48 signal = 1'b0; 
  
end 
endmodule