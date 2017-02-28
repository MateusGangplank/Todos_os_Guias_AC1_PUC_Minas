//Rafael Moreira Melo-405834

`define found    1
`define notfound 0

module  Ex02 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter
   start  = 3'b000,
   id1    = 3'b001,
   id11   = 3'b011,
   id110  = 3'b010,
   id1101 = 3'b110;

   reg [2:0] E1;
   reg [2:0] E2;

   always @( x or E1 )
    begin
     case( E1 )
      start:
        if ( x )
         E2 = start;
        else
         E2 = id1;
      id1:
        if ( x )
         E2 = id11;
        else
         E2 = start;
      id11:
        if ( x )
         E2 = id110;
        else
         E2 = id1;
      id110:
        if ( x )
         E2 = start;
        else
         E2 = id1101;
      id1101:
        if ( x )
         E2 = id11;
        else
         E2 = start;
     default:
         E2 = 3'bxxx;
     endcase
    end

   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;
     else
      E1 = 0;
    end

   always @( E1 )
    begin
     y = E1[2];
    end

endmodule

 module teste;
 reg   clk, reset, x;
 wire  e01;

 Ex02 moore1 ( e01, x, clk, reset );

 initial
  begin
		$display("Rafael Moreira Melo");
		$display("\n Tempo\tX   Sequencia a ser encontrada: 010" );

       clk   = 1;
       reset = 0;
       x     = 0;

   #5   reset = 1;
   #10  x = 0;
   #10  x = 1;
   #10  x = 1;
   #10  x = 0;
   #10  x = 0;
   #10  x = 1;
   #10  x = 0;
   #10  x = 1;

   #30 $finish;
 end 
 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %4b", $time, x, e01 );
  end 

endmodule