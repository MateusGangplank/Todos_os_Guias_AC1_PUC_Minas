
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
		#6 clk = ~clk; 
	end 
endmodule 

//--------------------------------------------------------------------------------------------

module pulse ( signal, clock ); 
	
	input clock; 
	output signal; 
	reg signal; 

always @ ( clock ) 
begin 
	 signal = 1'b0; 
#6 signal = 1'b1; 
#6 signal = 1'b0;
#6 signal = 1'b1;

end 
endmodule  

//-----------------------------------------------------------------------------------------------

module trigger ( signal, on, clock ); 
	input on, clock; 
	output signal; 
	reg signal; 

always @ ( negedge clock & on ) 
	begin 
		#6 signal = 1'b1; 
		#6 signal = 1'b0; 
	end 
endmodule  

//-----------------------------------------------------------------------------------------------

module testeclock_variacao_up_down; 

wire clk; 
clock clk1 ( clk ); 
reg p; 
wire p1, t1; 
pulse pulse1 ( p1, clk ); 

initial begin 
	p = 1'b0; 

end 

initial begin 

$dumpfile ( "testeclock_variacao_up_down.vcd" ); 
$dumpvars ( 1, clk, p1, p ); 
#120 $finish; 

end 
endmodule