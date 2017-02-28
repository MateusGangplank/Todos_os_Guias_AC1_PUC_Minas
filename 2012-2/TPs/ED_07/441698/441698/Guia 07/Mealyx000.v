// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------- 
// --- Mealy FSM 
// -------------- 
 
/* 
                        Mealy FSM Diagram 
                      __________________ 
                     /                    \ 
              1    v   1           0     1 | // found 
   [start] ---> [id1] ---> [id11] ---> [id110] 
     ^  \0      0 |       1 /  ^         0 | // not found 
      \_/        /          \__/         | 
       \________/                      / 
        \                            / 
         \_________________________/ 
*/ 
// constant definitions 
`define found 1 
`define notfound 0 
 
// FSM by Mealy 
module mealyx000 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter         // state identifiers  
   start    = 2'b00, 
   idx      = 2'b01, 
   idx0    = 2'b11, 
   idx00  = 2'b10; 
 
   reg [1:0] E1; // current state variables 
   reg [1:0] E2; // next state logic output 
 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = idx; 
        else 
         E2 = idx; 
      idx: 
        if ( x ) 
         E2 = idx; 
        else 
         E2 = idx0; 
      idx0: 
        if ( x ) 
         E2 = idx; 
        else 
         E2 = idx00; 
      idx00: 
        if ( x ) 
         begin 
           E2 =  idx; 
           y  = `notfound; 
         end 
        else 
         begin 
           E2 =  idx00; 
           y  = `found; 
         end 
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
 
endmodule // mealyx000