// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************


   module dff ( output q, output qnot, input d, input clk );
      reg q = 0, qnot = 1;

      always @( posedge clk )
		begin

         q <= d; qnot <= ~d;
      end
		
   endmodule // dff


   module tff ( output q, output qnot, input t, input clk, input preset, input clear );
      reg q, qnot;

      always @( posedge clk )
      begin

         if ( ~clear )
         begin

            q <= 0; qnot <= 1;
         end

         else if ( ~preset )
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
	
	
	module srff ( output q, output qnot, input s, input r, input clk );
      reg q, qnot;

      always @( posedge clk )
      begin

         if ( s & ~r )
         begin
            q <= 1; qnot <= 0;
         end

         else if ( ~s & r )
         begin
            q <= 0; qnot <= 1;
         end

         else if ( s & r )
         begin
            q <= 0; qnot <= 0; // arbitrary
         end
      end
   endmodule // srff
	
	
   module jkff ( output q, output qnot, input j, input k, input clk );
      reg q, qnot;

      always @( posedge clk )
      begin

         if ( j & ~k )
         begin
            q <= 1; qnot <= 0;
         end

         else if ( ~j & k )
         begin
            q <= 0; qnot <= 1;
         end

         else if ( j & k )
         begin
            q <= ~q; qnot <= ~qnot;
         end
      end
  endmodule // jkff
  

  module questao2(output q5n, output q4n, output q3n, output q2n, output q1n, input data, input clk);
  
	  wire q1n, q2n, q3n, q4n, q5n;
	  
	  dff DFF1(q1,q1n,data,clk);
	  dff DFF2(q2,q2n,q1,clk);
	  dff DFF3(q3,q3n,q2,clk);
	  dff DFF4(q4,q4n,q3,clk);
	  dff DFF5(q5,q5n,q4,clk);
	  
  endmodule // questao2
  
  
  module teste;
  
     reg data;
	  reg clk;
	  wire q1n, q2n, q3n, q4n, q5n;

	  questao2 Q2(q5n,q4n,q3n,q2n,q1n,data,clk);
	  
	  initial begin
	    data = 1;
	    clk = 1;
	    #1 data = 0;
		 #40 $finish;
	  end
	  
	  always begin
	    #5 clk = ~clk; 
     end
	
	initial begin
	  $monitor("%b %b %b %b %b",q5n,q4n,q3n,q2n,q1n);
		end 
  endmodule