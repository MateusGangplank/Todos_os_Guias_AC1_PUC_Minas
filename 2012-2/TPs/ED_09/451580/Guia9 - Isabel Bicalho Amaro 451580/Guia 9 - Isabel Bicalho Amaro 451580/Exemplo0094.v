// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************


   module jkff ( output q, output qnot, input j, input k, input preset, input clk );
      reg q = 0, qnot = 1;
      
		always begin
		#1 if(preset) begin
		  q<=1; qnot<=0;
		  end
		end
		
      always @( posedge clk )
      begin
        /* 
			if(~clr)
			begin
			   q <= 0; qnot <= 1;
			end
         else */if ( j & ~k | preset)
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
  
  
  module questao4(output[5:0]q,output[5:0]qnot,input data,input preset, input pulse);
	  wire clr2;
	  jkff JK0(q[0],qnot[0],data,data,preset,pulse);
	  jkff JK1(q[1],qnot[1],data,data,preset,q[0]);
	  jkff JK2(q[2],qnot[2],data,data,preset,q[1]);
	  jkff JK3(q[3],qnot[3],data,data,preset,q[2]);
	  jkff JK4(q[4],qnot[4],data,data,preset,q[3]);
	  jkff JK5(q[5],qnot[5],data,data,preset,q[4]);
  endmodule
  
  
  module teste;
     wire[5:0]qnot;
	  wire[5:0]q;
	  reg  pulse, data;
	  wire s1,s2,s3,s4,s5;
	  not not1(s1,qnot[0]);
	  not not2(s2,qnot[2]);
	  not not3(s3,qnot[4]);
	  not not4(s4,qnot[5]);
	  and and1(s5,s1,qnot[1],s2,qnot[3],s3,s4);
	  
	  questao4 Q4(q,qnot,data,s5,pulse);
	  
     initial begin
	    pulse = 1; data = 1;

		 #40 $finish;
	  end

   always begin #1 pulse=~pulse; end
	always @(posedge pulse) begin
	//initial begin
		$display("%b %5b",s5,q);
	end


  endmodule
  
  
  /*
    0 111111
    0 111110
    0 111101
    0 111100
    0 111011
    0 111010
    0 111001
    0 111000
    0 110111
    0 110110
    0 111111
    0 111110
    0 111101
    0 111100
    0 111011
    0 111010
    0 111001
    0 111000
    0 110111
    0 110110
	     */