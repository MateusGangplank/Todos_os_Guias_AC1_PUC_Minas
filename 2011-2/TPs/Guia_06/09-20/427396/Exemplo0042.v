// ------------------------- 
// Exemplo0042 - PULSE AND TRIGGER
// Nome: Eduardo Manoel 
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

// --------------------------- 
// -- PULSE 
// --------------------------- 
module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	
	always @ ( clock ) 
	begin 
		signal = 1'b1; 
		#3 signal = 1'b0; 
		#3 signal = 1'b1; 
		#3 signal = 1'b0; 
	end 
endmodule // pulse 

// --------------------------- 
// -- TRIGGER
// --------------------------- 
module trigger ( signal, on, clock ); 
	input on, clock; 
	output signal; 
	reg signal; 
	
	always @ ( posedge clock & on ) 
	begin 
		#60 signal = 1'b1; 
		#60 signal = 1'b0; 
	end 
endmodule // trigger 

//-----------------------------
// -- Modulo Principal - Exercicio0042
//-----------------------------
module Exemplo0042; 
	wire clock; 
	reg p; 
	wire Pulse1, Trigger1; 
	
	clock clk ( clock ); 
	pulse pulse1 ( Pulse1, clock ); 
	trigger trigger1 ( Trigger1, p, clock ); 
	
	initial begin 
		p = 1'b0; 
	end 
	
	initial begin 
		$dumpfile ( "D:/DUMPFILES/Exemplo042.vcd" ); 
		$dumpvars ( 1, clock, Pulse1, p, Trigger1 ); 
		$display ( " 1 CLOCK PULSE P TRIGGER ");
		$monitor( " %1b    %b    %b   %b   %b ", 1'b1, clock, Pulse1, p, Trigger1 );
		#060 p = 1'b1; 
		#120 p = 1'b0; 
		#180 p = 1'b1; 
		#240 p = 1'b0; 
		#300 p = 1'b1; 
		#360 p = 1'b0; 
		#376 $finish; 
	end 
endmodule // Exemplo0042 