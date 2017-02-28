// --Nome: Thaise Souto
// --Matricula: 395504
// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
`define found    1
`define notfound 0

module  Moore ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        // state identifiers
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b010,
   id110  = 3'b011,
   id1101 = 3'b100;  //  signal found

   reg [2:0] E1;	// current state variables
   reg [2:0] E2;	// next state logic output

// next state logic
   always @(x or E1)
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
         E2 = start;
      id11:
        if ( x )
         E2 = id1;
        else
         E2 = id110;
      id110:
        if ( x )
         E2 = id1;
        else
         E2 = start;
      id1101:
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
     y = E1[2];   // first bit of state value
    end // always at state changing

endmodule // Moore


module Exemplo0053; 
reg clk, reset, x; 
wire m2;
 
Moore moore1 ( m2, x, clk, reset ); 

initial 
begin 
$display ( "Guia 07 - Thaise Souto Martins - 395504" );
$display ( "Time   X   Moore" ); 

// initial values 
clk = 1; 
reset = 13; 
x = 0; 

// input signal changing 
#5 reset = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
 
#30 $finish; 
end // initial
 
always 
#13 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d %4b %4b ", $time, x, m2); 
end // always at positive edge clocking changing 
endmodule // Exemplo0053 