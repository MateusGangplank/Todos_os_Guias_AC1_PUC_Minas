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
module mealy000or111 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 reg z;
 
 parameter         // state identifiers  
   start    = 2'b00, 
   idx      = 2'b01; 
 
   reg [1:0] E1; // current state variables 
   reg [1:0] E2; // next state logic output 
 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
		  begin
    		E2 = idx; 
			z = x;
		  end
      idx: 
        if ( z == x ) 
         begin 
           E2 =  idx; 
           y  = `found; 
         end 
        else 
         begin 
           E2 =  start; 
           y  = `notfound; 
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
 
endmodule // 000or111