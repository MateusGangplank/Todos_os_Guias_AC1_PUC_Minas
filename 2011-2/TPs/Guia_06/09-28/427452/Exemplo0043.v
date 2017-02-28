// ---------------------------
// -- test clock generator (3)
// ---------------------------

`include "clock.v"
`ifndef statements  "clock.v"

module pulse1 ( signal, clock1 );
	input   clock1;
	output signal;
	reg      signal;
	
	always @ ( posedge clock1 )
		begin
			signal = 1'b1;
			#4  signal = 1'b0;
			#4  signal = 1'b1;
			#4  signal = 1'b0;
			#4  signal = 1'b1;
			#4  signal = 1'b0;
		end
endmodule // pulse


module pulse2 ( signal, clock1 );
	input	clock1;
	output signal;
	reg	signal;
	
	always @ ( posedge clock1 )
		begin
		signal = 1'b1;
			#5  signal = 1'b0;
		end
endmodule // pulse


module pulse3 ( signal, clock1 );
	input	clock1;
	output signal;
	reg	signal;
	
	always @ ( negedge clock1 )
		begin
		signal = 1'b1;
			#15 signal = 1'b0;
			#15 signal = 1'b1;
		end
endmodule // pulse


module pulse4 ( signal, clock1 );
	input	clock1;
	output signal;
	reg	signal;
	
	always @ ( negedge clock1 )
		begin
			signal = 1'b1;
			#20 signal = 1'b0;
			#20 signal = 1'b1;
			#20 signal = 1'b0;
		end
endmodule // pulse


module Exemplo0043;

	wire clock;
	clock clk ( clock );

	wire	p1,p2,p3,p4;

	pulse1	pls1	( p1, clock1 );
	pulse2	pls2	( p2, clock1 );
	pulse3	pls3	( p3, clock1 );
	pulse4	pls4	( p4, clock1 );
	
	initial begin
		$dumpfile ( " Exemplo0043.vcd" );
		$dumpvars ( 1, clock1, p1, p2, p3, p4 );
		
		#480 $finish;
	end
endmodule // Exemplo0043