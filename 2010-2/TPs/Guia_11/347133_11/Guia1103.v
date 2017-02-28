//Henrique Carvalho Parreira
//347133


`define found    1
`define notfound 0


module exe03 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         
   start  = 2'b00,
   id1    = 2'b01,
   id10   = 2'b10,
	id100  = 2'b11;
   

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
         E2 = start;
        else
         E2 = id100;
      id100:
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

endmodule //exe03


module teste;
 reg   clk, reset, x;
 wire  e03;

 exe03 exe3 ( e03, x, clk, reset );

 initial
  begin
   $display("Henrique Carvalho Parreira - 347133");
$display("Guia 11 Ex:01\n");
   $display ( "Time     X   Exe03" );


       clk   = 1;
       reset = 0;
       x     = 0;


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
 end

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b  %4b", $time, x, e03 );
  end 

endmodule

/* 	TESTE

    
	 Henrique Carvalho Parreira
	 347133

    
    Time     X   Exe03
      10     0     0
      20     1     0
      30     0     0
      40     0     0
      50     1     1
      60     0     0
      70     1     0
      80     0     0
      90     1     0
     100     1     0
     110     1     0
     
     */