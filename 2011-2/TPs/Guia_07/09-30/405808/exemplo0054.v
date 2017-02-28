// -------------- 
// --- Mealy FSM  (Flying Spaguetti Monster)
// -------------- 
 
/*//--
//----  e1(0) -1> e2(01) / e2(01) -1> e3(011)  / e3(011) -1> e4(0111) / e4(0111) -n> end true 
//----        -0> e1(0 ) /        -0> e1(0)    /         -0> e1(0)    / 
*///--
 
//-- constant definitions 
`define found    1 
`define notfound 0 
 
//-- FSM by Mealy 
module exempo0052 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter         // --state identifiers  
   start   = 4'b0000, 
   id01    = 4'b0001, 
   id011   = 4'b0011,
	id0111  = 4'b0111; 
 
   reg [4:0] E1; // --current state variables 
   reg [4:0] E2; // --next state logic output 
 
 
// --next state logic 
   always @( x or E1 ) 
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = id01; 
        else 
         E2 = start; 
      id01: 
        if ( x ) 
         E2 = id011; 
        else 
         E2 = start; 
      id011: 
        if ( x ) 
         E2 = id0111; 
        else 
         E2 = start;
		id0111: 
        if ( x ) 
         begin 
           E2 =  start; 
           y  = `found; 
         end 
        else 
         begin 
           E2 =  start; 
           y  = `notfound; 
         end 
      default:   // undefined state 
           E2 =  5'bxx; 
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
 
endmodule // mealy10101 
 
