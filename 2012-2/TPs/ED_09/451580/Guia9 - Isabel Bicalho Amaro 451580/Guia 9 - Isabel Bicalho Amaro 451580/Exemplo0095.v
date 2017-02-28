// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************
   
	   module tff ( output q, output qnot, input t, input clk, input preset, input clear );
      reg q = 0, qnot = 1;

      always begin
		#1 if(clear) begin
		  q<=0; qnot<=1;
		  end
		end

      always @( posedge clk )
      begin

         if ( clear )
         begin

            q <= 0; qnot <= 1;
         end

         else if ( preset )
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

   module jkff ( output q, output qnot, input j, input k, input clr, input clk );
      reg q = 0, qnot = 1;
      
		always begin
		#1 if(clr) begin
		  q<=0; qnot<=1;
		  end
		end
		
      always @( posedge clk )
      begin
        /* 
			if(~clr)
			begin
			   q <= 0; qnot <= 1;
			end
         else */if ( j & ~k )
         begin
            q <= 1; qnot <= 0;
         end

         else if ( ~j & k | clr)
         begin
            q <= 0; qnot <= 1;
         end

         else if ( j & k )
         begin
            q <= ~q; qnot <= ~qnot;
         end
      end
  endmodule // jkff
  

		
  module questao5(output[3:0]q,output[3:0]qnot,input pulse,input preset, input clear);
	  wire clr2;
	  tff JK0(q[0],qnot[0],pulse,pulse,preset,clear);
	  tff JK1(q[1],qnot[1],qnot[0],qnot[0],preset,clear);
	  tff JK2(q[2],qnot[2],qnot[1],qnot[1],preset,clear);
	  tff JK3(q[3],qnot[3],qnot[2],qnot[2],preset,clear);
  endmodule
  
  
  module teste;
     wire[3:0]qnot;
	  wire[3:0]q;
	  reg preset;
	  reg  pulse, data, clr;
	  wire s1,s2,s3,s4,clr1;
	  not not1(s1,q[0]);
	  not not2(s2,q[2]);
	  and and1(s3,q[3],s2,q[1],s1);
	  or or1(clr1,clr,s3);
	  questao5 Q5(q,qnot,pulse,preset,clr1);
	  
     initial begin
	    pulse = 1; data = 1; preset = 0 ;clr = 0;

		 #40 $finish;
	  end

   always begin #1 pulse=~pulse; end
	always @(posedge pulse) begin
	//initial begin
		$display("%5b",q);
	end


  endmodule
  
  
  /*
     1111
     0000
     0001
     0010
     0011
     0100
     0101
     0110
     0111
     1000
     1001
     0000
     0001
     0010
     0011
     0100
     0101
     0110
     0111
     1000 
	     */