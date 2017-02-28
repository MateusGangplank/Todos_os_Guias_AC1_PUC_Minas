//Nome: Isabella Gonçales
//Matrícula: 420120



// ---------------------------
// -------Mealy Exercicio 04 -------
// ---------------------------


// constant definitions
`define found    1
`define notfound 0


module seq1010_mealy ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter
   start  = 2'b00,
   id1    = 2'b01,
   id10   = 2'b10,
   id101  = 3'b101;

   reg [2:0] E1;
   reg [2:0] E2;


   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = id1;
        else
         E2 = start;
      id1:
        if ( x )
         E2 = start;
        else
         E2 = id10;
      id10:
        if ( x )
         E2 = id101;
        else
         E2 = start;
      id101:
        if ( x )
	 begin
	   E2 =  start;
	   y  = `notfound;
	 end
	else
	 begin
	   E2 =  id10;
	   y  = `found;
	 end
      default:
           E2 =  2'bxx;
     endcase
    end 


   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;
     else
      E1 = 0;
    end // always at signal changing

endmodule // seq1010_mealy

module seq1010_test;
 reg   clk, reset, x;
 wire  m1, m2;

 seq1010_mealy mealy1 ( m1, x, clk, reset );

 initial
  begin
   $display ( "Time     X   Mealy Moore" );

// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

// input signal changing
  #5   reset = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;

  #30 $finish;
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %4b", $time, x, m1 );
	
  end
endmodule
