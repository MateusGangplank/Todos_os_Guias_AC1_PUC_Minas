// --Nome: Milton costa teles da silva
// --Matricula: 002751
// --------------------
// --- Mealy-Moore FSM 
// --------------------
// 
`define found    1
`define notfound 0

module Mealy( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         
   start  = 2'b00,
   id1    = 2'b01,
   id11   = 2'b10,
   id110  = 2'b11;

   reg [1:0] E1;	// current state variables
   reg [1:0] E2;	// next state logic output

   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = start;
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
         E2 = start;
      id110:
        if ( x )
	 begin
	   E2 =  id1;
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
	 
   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;    // updates current state
     else
      E1 = 0;     // reset
    end 

endmodule//module Mealy


module Exemplo0054; 
reg clk, reset, x; 
wire y;
 
Mealy mealy( y, x, clk, reset ); 

initial 
begin 
$display ( "Guia 07 -Nome: Milton costa teles da silva-Matricula: 002751" );
$display ( " Time   X  Mealy" ); 

// initial values 
   clk = 1; 
   reset = 0; 
   x = 0; 

// input signal changing 
   #5 reset = 1; 
   #10 x = 1; 
   #10 x = 1; 
   #10 x = 1; 
   #10 x = 0;  
   #30 $finish; 
end // initial
 
always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d %4b %4b", $time,x,y); 
end // always at positive edge clocking changing 
endmodule // Exemplo0054