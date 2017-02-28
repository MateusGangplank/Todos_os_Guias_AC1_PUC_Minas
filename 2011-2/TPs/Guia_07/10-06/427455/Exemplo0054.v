// constant definition 
`define found       1 
`define notfound 0 
 
// FSM by Moore 
module  moore0054 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter        // state identifiers 
   start     = 3'b000, 
   id01       = 3'b001, 
   id011     = 3'b011, 
   id0111   = 3'b111; 
    
   reg [2:0] E1; // current state variables 
   reg [2:0] E2; // next state logic output 
 
 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     case( E1 ) 
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
         E2 = start; 
        else 
         E2 = start;       
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
 
// output logic 
   always @( E1 ) 
    begin 
     y = E1[2];   // first bit of state value 
    end // always at state changing 
 
endmodule // moore0053