// Guia 09-03 - Gerador de pulso
// Nome:  Marley RIbeiro
// Matricula: 414510



module clock ( clk ); 
	
	output clk; 
	reg clk; 

initial 
	begin 
		clk = 1'b0; 
	end 
//--------------------------------------------------------------------------------------

always 
	begin 
		#60 clk = ~clk; 
	end 
endmodule 

//--------------------------------------------------------------------------------------


module pulse ( signal, clock ); 
	
	input clock; 
	output signal; 
	reg signal; 
	
always @ ( clock ) 
	begin 
		 signal = 1'b0; 
	# 15signal = 1'b1; 
	# 15 signal = 1'b0; 
  
end 
endmodule 

//--------------------------------------------------------------------------------------

		
module trigger ( signal, on, clock ); 

	input on, clock; 
	output signal; 
	reg signal; 
	
always @ ( negedge clock & on ) 
	begin 
		#15 signal = 1'b1; 
		#15 signal = 1'b0; 
end 
endmodule  

//--------------------------------------------------------------------------------------


module testeclock_quadruplofrequencia; 

	wire clk; 
	clock clk1 ( clk ); 
	reg p; 
	wire p1, t1; 
	pulse pulse1 ( p1, clk ); 

initial begin 
	p = 1'b0; 
end 

initial begin 
$dumpfile ( "testeclock_quadruplofrequencia.vcd" ); 
$dumpvars ( 1, clk, p1, p ); 
	#060 p = 1'b1; 
	#120 p = 1'b0; 
	#180 p = 1'b1; 
	#240 p = 1'b0; 
	#300 p = 1'b1; 
	#360 p = 1'b0; 
	#376 $finish; 
end 
endmodule