// Guia 10-2 -Moore 
// Nome: Marley Ribeiro
//--------------------------------------------------

// constant definition
`define found    1
`define notfound 0

// FSM by Moore
module  seq0110_moore ( y, x, clk, reset );

	output y;
	input  x;
	input  clk;
	input  reset;

	reg    y;

	parameter        // state identifiers
		start  = 3'b000,
		id0    = 3'b110,
		id01   = 3'b001,
		id011  = 3'b010,
		id0110 = 3'b101;  //  signal found

	reg [2:0] E1;	// current state variables
	reg [2:0] E2;	// next state logic output

	// next state logic
	
		always @( x or E1 )
		begin
		y = `notfound;
		
		case( E1 )
		start:
			if ( x )
				E2 = start;
			else
				E2 = id0;
			
			id0:
				if ( x )
					E2 = id01;
				else
					E2 = id0;
			
			id01:
				if ( x )
					E2 = start;
				else
					E2 = id011;
			
			id011:
				if ( x )
					E2 = id0110;
				else
					E2 = id0;
			
			id0110:
			if ( x )
				begin
			 		E2 = start;
					y = `found;
				end
			else
				begin
					E2 = id0;
					y = `found;
				end
			
			default:   // undefined statee  
				E2 = 3'bxxx;
				
		endcase
		end // always at signal or state changing


	// state variables
		always @( posedge clk or negedge reset )
		begin
			if ( reset )
				E1 = E2;    // updates current state
			else
				E1 = 0;     // reset
		end // always at signal changing

endmodule // seq0110_moore

// --- TESTE

module teste;
 reg   clk, reset, x;
 wire  e01;

 seq0110_moore moore1 ( e01, x, clk, reset );

 initial
  begin
   $display ( "\n Marley Ribeiro" );
   $display ( "Time x exer2" );

// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

// input signal changing
  #5   reset = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;

  #30 $finish;
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %4b", $time, x, e01 );
  end // always at positive edge clocking changing

endmodule