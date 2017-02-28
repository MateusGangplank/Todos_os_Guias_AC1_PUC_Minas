// Guia 09-01 - Gerador de pulso
// Nome: Marley Ribeiro 
// Matricula: 414510

 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module clock ( clk ); 
	
	output clk; 
	reg clk; 

initial 
	begin 
		clk = 1'b0; 
	end 

always 
	begin 
		#30 clk = ~clk; 
	end 
endmodule 

//------------------------------------------------------------------------------------------

module pulse ( signal, clock ); 
	
	input clock; 
	output signal; 
	reg signal; 
	
always @ ( clock ) 
	begin 
			 signal = 1'b0; 
		#15 signal = 1'b1; 
  
end 
endmodule 

//---------------------------------------------------------------------------------------------
		
module trigger ( signal, on, clock ); 

	input on, clock; 
	output signal; 
	reg signal; 
	
always @ ( negedge clock & on ) 
	begin 
		#30 signal = 1'b1; 
		#30 signal = 1'b0; 
end 
endmodule  

//-------------------------------------------------------------------------------

module testeclock_metade_frequencia; 

	wire clk; 
	clock clk1 ( clk ); 
	reg p; 
	wire p1, t1; 
	pulse pulse1 ( p1, clk ); 

initial begin 
	p = 1'b0; 
end 

initial begin 
	$dumpfile("testeclock_metade_frequencia.vcd");
	$dumpvars ( 1, clk, p1, p ); 
	
	#030 p = 1'b1; 
	#060 p = 1'b0; 
	#090 p = 1'b1; 
	#120 p = 1'b0; 
	#150 p = 1'b1; 
	#180 p = 1'b0;  
	#196 $finish; 
end 
endmodule
		
