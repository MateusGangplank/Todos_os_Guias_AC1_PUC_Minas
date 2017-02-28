// ------------------------- 
// Mealy x000 
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// -------------------------


// constant definitions 
   `define found 1 
   `define notfound 0 
	
// FSM by Mealy 
    module mealy000_111 ( y, x, clk, reset ); 
      output y; 
      input x; 
      input clk; 
      input reset; 

      reg y; 
		
    parameter // state identifiers 
      start = 4'b0000, 
      id1 = 4'b0001, 
      id11 = 4'b0011, 
      id110 = 4'b0010, 
		id111 = 4'b0111;
		
		
		
   reg [3:0] E1; // current state variables 
   reg [3:0] E2; // next state logic output
	 
// next state logic 
   always @( x or E1 ) 
	
   begin 
   y = `notfound; 
   case ( E1 ) 
   start: 
    if ( x ) 
      E2 = id11; 
    else 
      E2 = id1; 
   id1: 
    if ( x ) 
      E2 = id11; 
    else 
      E2 = id110; 
   id11: 
    if ( x ) 
      E2 = id111; 
    else 
      E2 = id1; 	
	 id111:
	  if ( x ) 
	begin 
      E2 = id111; 
      y = `found; 
      end
    else 
      begin 
      E2 = id1; 
		y = `notfound;
      end 
		
		id110:
		if ( x ) 
			begin 
				E2 = id11; 
				y = `notfound; 
			end
 		else 
			begin 
				E2 = id110; 
				y = `found;
			end 
		
    default: // undefined state 
      E2 = 2'bxx; 
    endcase 
    end // always at signal or state changing 

// state variables 
     always @( posedge clk or negedge reset ) 
     begin 
      if ( reset ) 
       E1 = E2; // updates current state 
      else 
       E1 = 0; // reset 
      end // always at signal changing 
     
	   endmodule // 