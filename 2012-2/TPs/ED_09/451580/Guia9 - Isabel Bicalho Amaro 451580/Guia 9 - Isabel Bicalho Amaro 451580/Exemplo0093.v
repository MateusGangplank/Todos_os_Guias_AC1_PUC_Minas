// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************


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
  
  
  module questao3(output[5:0]q,output[5:0]qnot,input data,input clr, input pulse);
	  wire clr2;
	  jkff JK0(q[0],qnot[0],data,data,clr,pulse);
	  jkff JK1(q[1],qnot[1],data,data,clr,qnot[0]);
	  jkff JK2(q[2],qnot[2],data,data,clr,qnot[1]);
	  jkff JK3(q[3],qnot[3],data,data,clr,qnot[2]);
	  jkff JK4(q[4],qnot[4],data,data,clr,qnot[3]);
	  jkff JK5(q[5],qnot[5],data,data,clr,qnot[4]);
  endmodule
  
  
  module teste;
     wire[5:0]qnot;
	  wire[5:0]q;
	  reg clr, pulse, data;
	  wire s1,s2,s3,s4,s5,clr1;
	  not not1(s1,q[0]);
	  not not2(s2,q[2]);
	  not not3(s3,q[4]);
	  not not4(s4,q[5]);
	  nand nand1(s5,s1,q[1],s2,q[3],s3,s4);
	  nand nand2(clr1,clr,s5);
	  
	  questao3 Q3(q,qnot,data,clr1,pulse);
	  
     initial begin
	    pulse = 1; clr = 1; data = 1;

		 #40 $finish;
	  end

   always begin #1 pulse=~pulse; end
	always @(posedge pulse) begin
	//initial begin
		$display("%5b",q);
	end


  endmodule
  
  
  /*
    111111
    000000
    000001
    000010
    000011
    000100
    000101
    000110
    000111
    001000
    001001
    000000
    000001
    000010
    000011
    000100
    000101
    000110
    000111
    001000    */