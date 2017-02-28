// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************


   module dff ( output q, output qnot, input d, input clk , input preset);
      reg q = 0, qnot = 1;
      
		always begin
		#1 if(preset) begin
		  q<=1; qnot<=0;
		  end
		end
		
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
  

  module questao5(output q, input[4:0]preset, input clk);
     reg a = 0;
	  wire q1,q2,q3,q4,q5;
	  wire q1n, q2n, q3n, q4n, q5n, data1;
	  
	  dff DFF1(q4,q4n,a,clk,preset[4]);
	  dff DFF2(q3,q3n,q4,clk,preset[3]);
	  dff DFF3(q2,q2n,q3,clk,preset[2]);
	  dff DFF4(q1,q1n,q2,clk,preset[1]);
	  dff DFF5(q,q5n,q4,clk,preset[0]);
	  
  endmodule // questao5
  
  
  module teste;
  
     reg load;
	  reg[4:0]preset;
	  wire[4:0]preset1;
	  reg clk;
	  wire q1, q2, q3, q4, q5;
	  wire q;

     and and1(preset1[4],load,preset[4]);
	  and and2(preset1[3],load,preset[3]);
	  and and3(preset1[2],load,preset[2]);
	  and and4(preset1[1],load,preset[1]);
	  and and5(preset1[0],load,preset[0]);
	  questao5 Q5(q,preset1,clk);
	  
	  initial begin
       preset = 5'b10111;
	    clk = 0;
		 #1 load = 1;
		 #1 load = 0;
		 #50 $finish;
	  end
	  
	  always begin
	    #3 clk = ~clk; 
     end
	
	initial begin
	  $monitor("%b",q);
		end 
  endmodule