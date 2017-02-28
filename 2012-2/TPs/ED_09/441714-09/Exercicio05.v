//-------------------------
//Yousef Otacilio
//441714
//Guia09 Exercicio 05
//------------------------
//


`include "clock.v"

//------------------------------------------------------
//------------------------------------------------------


module tff ( output q, output qnot, input t, input clk, input preset, input clear );

reg q, qnot;
always @( posedge clk )

begin
  
  if ( ~clear )
    begin
      q <= 0; qnot <= 1;
    end
  
  else
    if ( ~preset )
      begin
       q <= 1; qnot <= 0;
      end
    
	 else
      begin
       if ( t )
          begin
           q <= ~q; qnot <= ~qnot;
          end
      end
end
endmodule // tff 	
//------------------------------------------------------
//------------------------------------------------------


module Ex05 (output [3:0]s, input clk, input clear);

   wire [3:0]w;
	wire [3:0]wn;
   wire clr;
	
	and AND1 (AC, w[0], w[1], w[2], w[3]);
	or OR1 (clr, clear, AC);

tff TF1(w[0],wn[0],clk,clk,clk,AC);
tff TF2(w[1],wn[1],wn[0],wn[0],wn[0],AC);
tff TF3(w[2],wn[2],wn[0],wn[0],wn[0],AC);
tff TF4(w[3],wn[3],wn[0],wn[0],wn[0],AC);

	assign s[5] = q[0];	 
	 	 
	 
endmodule//Ex05



module teste;

   wire [5:0]s;
	wire CLK;
	
	reg x;
	reg clr;
	reg pre;
	
	clock clk(CLK);
	
	Ex03 tetes(s,CLK, x, pre, clr);
	
	initial begin
	
		clr = 1;
		pre = 0;
		x = 1;
		
		
		$display(" Guia09 - Exercicio03");
		$display(" Yousef Otacilio");
		$display(" 441714 ");
	    
		$display("Saida   Clock ");
		$monitor("%6b    %1b  "  , s, CLK);
	
		
		#1 clr = 1;
		#2 clr = 1;
		#2 x = 0;
		
		#64 $finish;
	end
endmodule //