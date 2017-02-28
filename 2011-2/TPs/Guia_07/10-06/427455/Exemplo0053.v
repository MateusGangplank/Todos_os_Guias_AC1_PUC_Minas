// constant definition 
`define found       1 
`define notfound 0 
 
// FSM by Moore 
module  moore0053 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter        // state identifiers 
   start     = 4'b0000, 
   id1       = 4'b0001, 
   id10     = 4'b0010, 
   id101   = 4'b0101, 
   id1010 = 4'b1010;  //  signal found 
 
   reg [3:0] E1; // current state variables 
   reg [3:0] E2; // next state logic output 
 
 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     case( E1 ) 
      start: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = start; 
      id1: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = id10; 
      id10: 
        if ( x ) 
         E2 = id101; 
        else 
         E2 = start; 
      id101: 
        if ( x ) 
         E2 = start; 
        else 
         E2 = id1010; 
      id1010: 
        if ( x ) 
         E2 = id1; 
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
     y = E1[3];   // first bit of state value 
    end // always at state changing 
 
endmodule // moore0053