// -----------------------------------------------------
// Guia 10-03
// Nome: Ludmily Caldeira da Silva e Larissa Fernandes
// Matricula: 417290 e 410476
// -----------------------------------------------------


// constant definitions
`define found    1
`define notfound 0


module seq1010_mealy ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         // state identifiers 
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010,
   id1101 = 3'b110; 
	
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
         E2 = id1;
        else
         E2 = id11;
      id11:
        if ( x )
		    E2 = id110;
		 else
	 	   E2 =  id11;
	  
	  id110:
        if ( x )
		  begin
        E2 = id1;
		  y  = `notfound;
		  end
        else
		  begin
         E2 = id1101;
			y  = `found;
			end
	
		id1101:
        if ( x )
        E2 = id110;
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

endmodule //
