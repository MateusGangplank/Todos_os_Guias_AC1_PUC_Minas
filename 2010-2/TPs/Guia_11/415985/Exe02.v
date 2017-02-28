// ---------------------
// Guia 11 - Exercicio 02
// Nome: Bruno César Lopes Silva
// Matricula: 415985
// ---------------------
 
//constant definitions
`define found    1
`define notfound 0

module Moore ( b, a, clk, reset );
 output b;
 input  a;
 input  clk;
 input  reset;

 reg    b;

 parameter         // state identifiers 
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010,
	id111  = 3'b100;

   reg [1:0] E1;	// current state variables
   reg [1:0] E2;	// next state logic output

// next state logic
   always @( a or E1 )
    begin
     b = `notfound;
     case ( E1 )
      start:
        if ( a )
         E2 = start;
        else
         E2 = id1;
      id1:
        if ( a )
         E2 = id11;
        else
         E2 = id1;
      id11:
        if ( a )
         E2 = id110;
        else
         E2 = id1;
      id110:
        if ( a )		  
	 begin
	   E2 = id11;
	   b  = `notfound;
	 end
	else
	 begin
	   E2 =  id1;
	   b  = `found;
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

endmodule //Moore

module Exe02;
 reg   clk, reset, a;
 wire  m2;
 
 Moore moore1 ( m2, a, clk, reset );

 initial
  begin
   $display ( "Time     x    Moore" );

// initial values
       clk   = 1;
       reset = 0;
       a     = 0;		 

// input signal changing
  #5   reset = 1;
  #10  a = 1;
  #10  a = 1;
  #10  a = 0;
  #20  a = 1;
  #10  a = 0;
  #10  a = 0;
  #10  a = 1;
  #10  a = 0;
  #10  a = 0;
  #10  a = 1;
  #10  a = 0;
  #10  a = 0;
  #10  a = 1;

  #40 $finish;
 
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %5b", $time, a, m2 );
  end // always at positive edge clocking changing

endmodule // Exe02