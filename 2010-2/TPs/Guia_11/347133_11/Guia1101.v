// Nome: Henrique Carvalho Parreira - 347133
// Guia 11 ex01 


`define found    1
`define notfound 0


module exe01 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        
   start  = 2'b00,
   id1    = 2'b01,
   id10   = 2'b10;
   

   reg [1:0] E1;
   reg [1:0] E2;	


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
         E2 = id1;
        else
         E2 = id10;
      id10:
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
    end 

endmodule // end module 


module teste;
 reg   clk, reset, x;
 wire  e01;

 exe01 exe1 ( e01, x, clk, reset );

 initial
  begin
$display("Henrique Carvalho Parreira - 347133");
$display("Guia 11 Ex:01\n");
   $display ( "Time     X   Ex01" );

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
   $display ( "%4d  %4b  %4b", $time, x, e01 );
  end // always at positive edge clocking changing

endmodule


/* 	TESTE

Henrique Carvalho Parreira
347133

    Time     X   Ex01
      10     0     0
      20     1     0
      30     0     0
      40     0     0
      50     1     0
      60     0     0
      70     1     1
      80     0     0
      90     1     1
     100     1     0
     110     1     0
     
     */