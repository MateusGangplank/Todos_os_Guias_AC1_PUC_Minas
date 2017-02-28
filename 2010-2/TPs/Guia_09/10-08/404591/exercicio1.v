// ---------------------
// Guia 09_01 - Gerador de pulso
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// ---------------------

//Implementar um gerador de pulsos com frequência igual à metade da frequência (dobro do período) do "clock".
//Gerar a carta de tempo do circuito para ambos os sinais.
 
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
		#60 clk = ~clk; 
	end 
endmodule 

module pulse ( signal, clock ); 
	
	input clock; 
	output signal; 
	reg signal; 
	
always @ ( clock ) 
	begin 
			 signal = 1'b0; 
		#30 signal = 1'b1; 
  
end 
endmodule 

		
module trigger ( signal, on, clock ); 

	input on, clock; 
	output signal; 
	reg signal; 
	
always @ ( negedge clock & on ) 
	begin 
		#60 signal = 1'b1; 
		#60 signal = 1'b0; 
end 
endmodule  

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
	
	#060 p = 1'b1; 
	#120 p = 1'b0; 
	#180 p = 1'b1; 
	#240 p = 1'b0; 
	#300 p = 1'b1; 
	#360 p = 1'b0; 
	#376 $finish; 
end 
endmodule
		
