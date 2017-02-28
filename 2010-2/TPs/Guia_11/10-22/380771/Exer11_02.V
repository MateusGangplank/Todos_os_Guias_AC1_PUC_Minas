//
// AC 1 - 2010
// TP 11_02
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//



`define found    1
`define notfound 0


module  exe02 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter        
   start  = 3'b000,
   id0    = 3'b001,
   id01   = 3'b011,
   id010  = 3'b010,
   id0101 = 3'b110;  

   reg [2:0] E1;	
   reg [2:0] E2;	


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
 wire  e02;

 exe02 exe2 ( e02, x, clk, reset );

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
   $display ( "%4d  %4b  %4b", $time, x, e02 );
  end 
endmodule