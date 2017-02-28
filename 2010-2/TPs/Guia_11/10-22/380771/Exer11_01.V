//
// AC 1 - 2010
// TP 11_01
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//



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

endmodule 

module teste;
 reg   clk, reset, x;
 wire  e01;

 exe01 exe1 ( e01, x, clk, reset );

 initial
  begin
    $display("Igor Rodrigues de Oliveira - 380771");
      $display("Guia 10");
		$display("AC - 2010");


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
   $display ( "%4d  %4b  %4b", $time, x, e01 );
  end

endmodule