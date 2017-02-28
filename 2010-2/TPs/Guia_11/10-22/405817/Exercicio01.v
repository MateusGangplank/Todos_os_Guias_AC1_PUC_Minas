// ---------------------
// Guia 1101 - Implementar uma máquina de estados finitos (Mealy - FSM)
//     capaz de reconhecer uma sequência (101)
//     com interseção (10101 será considerada).
//
//
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// constant definitions

`define found    1
`define notfound 0



module Mealy ( b, a, clk, reset );
 output b;
 input  a;
 input  clk;
 input  reset;

 reg    b;

 parameter         // state identifiers 
   
	start  = 2'b00,
   id1    = 2'b01,
   id11   = 2'b11;

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
         E2 = start;
        else
         E2 = id11;
      id11:
        if ( a )		  
	  begin
	   E2 = start;
	   b  = `found;
	  end
	 else
	  begin
	   E2 =  id11;
	   b  = `notfound;
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

endmodule

module Exercicio01;
 reg   clk, reset, a;
 wire  m1;

 Mealy mealy1 ( m1, a, clk, reset ); 

 initial
  
  begin
   
	$display ( "Time     x   Mealy" );

// initial values
       
		 clk   = 1;
       reset = 0;
       a     = 0;

// input signal changing
  
  #5   reset = 1;
  #10  a = 1;
  #10  a = 0;
  #10  a = 0;
  #10  a = 0;
  #10  a = 1;
  #10  a = 0;
  #10  a = 0;
  #10  a = 1;
  #10  a = 0;
  #10  a = 1;

  #40 $finish;
 
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  
  begin
   
	$display ( "%4d  %4b  %4b", $time, a, m1);
 
  end

endmodule // Exercicio01