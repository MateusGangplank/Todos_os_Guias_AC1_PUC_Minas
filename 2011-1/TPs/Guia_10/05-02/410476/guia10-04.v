// -----------------------------------------------------
// Guia 10-04
// Nome: Ludmily Caldeira da Silva e Larissa Fernandes
// Matricula: 417290 e 410476
// -----------------------------------------------------


// --------------
// --- Moore FSM
// --------------


// constant definition
`define found    1
`define notfound 0

// FSM by Moore
module  seq000_mealy ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        // state identifiers
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010;

   reg [2:0] E1;	// current state variables
   reg [2:0] E2;	// next state logic output

// next state logic
   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
  		  E2 =  start;		
        else
        E2 = id1; 
      id1:
        if ( x )
         E2 = start;
        else
         E2 = id11;
      id11:
        if ( x )
		  begin
        E2 =  start;
		   y  = `notfound;
			end	  	 	 
	  else
	 begin
	   E2 =  id110;
	   y  = `found;
	 end
	 
	  id110:
        if ( x )
        E2 = start;
        else
         E2 = id1;
         		
 default:   // undefined state
           E2 =  2'bxx;
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

endmodule //

module  seq111_mealy ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        // state identifiers
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010;

   reg [2:0] E1;	// current state variables
   reg [2:0] E2;	// next state logic output

// next state logic
   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
  		  E2 =  id1;		
        else
        E2 = start; 
      id1:
        if ( x )
         E2 = id11;
        else
         E2 = start;
      id11:
        if ( x )
		  begin
        E2 =  id110;
		   y  = `found;
			end	  	 	 
	  else
	 begin
	   E2 =  start;
	   y  = `notfound;
	 end
	 
	 id110:
        if ( x )
        E2 = id1;
        else
         E2 = start;

	          		
 default:   // undefined state
           E2 =  2'bxx;
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


endmodule // seq1101_moore

module final1 (s, x, clk, reset );

output s;
 input  x;
 input  clk;
 input  reset;
 wire y, w;

seq000_mealy m1 ( y, x, clk, reset );
seq111_mealy m2 ( w, x, clk, reset );

or OR1 (s, y, w);
 
endmodule

