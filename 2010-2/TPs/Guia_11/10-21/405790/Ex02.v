//Guia 11
//Nome: Bruno Calil Nicoliello Moreira
//Matricula: 405790	
//21/10/2010
//----------------------

// --------------
// --- Exercicio 02
// --------------

// constant definitions
`define found    1
`define notfound 0

// Modulo Moore 0101
module  exe02 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        // state identifiers
   start  = 3'b000,
   id0    = 3'b001,
   id01   = 3'b011,
   id010  = 3'b010,
   id0101 = 3'b110;  //  signal found

   reg [2:0] E1;	// current state variables
   reg [2:0] E2;	// next state logic output

// next state logic
   always @( x or E1 )
    begin
     case( E1 )
      start:
        if ( x )
         E2 = start;
        else
         E2 = id0;
      id0:
        if ( x )
         E2 = id01;
        else
         E2 = start;	
      id01:
        if ( x )
         E2 = id01;  
        else
         E2 = id010;
      id010:
        if ( x )
         E2 = id0101;
        else
         E2 = start;
      id0101:
        if ( x )
         E2 = start;
        else
         E2 = start;
     default:   // undefined state  
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

endmodule //exe02


// --------------------
// --- TESTE
// --------------------
//
module teste;
 reg   clk, reset, x;
 wire  e02;

 exe02 exe2 ( e02, x, clk, reset );

 initial
  begin
   $display ( "Bruno Calil Nicoliello Moreira - 405790" );
   $display ( "Time     X   Exe02" );

// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

// input signal changing
  #5   reset = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;

  #30 $finish;
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %4b", $time, x, e02 );
  end 

endmodule