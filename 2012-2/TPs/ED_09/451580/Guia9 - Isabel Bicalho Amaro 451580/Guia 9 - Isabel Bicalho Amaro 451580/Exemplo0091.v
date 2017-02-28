// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************


   module jkff ( output q, output qnot, input j, input k, input clr, input clk );
      reg q = 0, qnot = 1;
      
      always @( posedge clk )
      begin
         
			if(~clr)
			begin
			   q <= 0; qnot <= 1;
			end
         else if ( j & ~k )
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
  
  
  module questao1(output[4:0]qnot,input data,input clr, input pulse);
     wire[4:0]q;
	  jkff JK0(q[0],qnot[0],data,data,clr,pulse);
	  jkff JK1(q[1],qnot[1],data,data,clr,qnot[0]);
	  jkff JK2(q[2],qnot[2],data,data,clr,qnot[1]);
	  jkff JK3(q[3],qnot[3],data,data,clr,qnot[2]);
	  jkff JK4(q[4],qnot[4],data,data,clr,qnot[3]);
  endmodule
  
  
  module teste;
     wire[4:0]qnot;
	  reg clr, pulse, data;
	  questao1 Q1(qnot,data,clr,pulse);
	  
     initial begin
	    pulse = 0; clr = 0; data = 1;
		 #1 clr = 1;

		 #40 $finish;
	  end

   always begin #1 pulse=~pulse; end
	always @(pulse) begin
	//initial begin
		$display("%5b",qnot);
	end


  endmodule
  
  
  /*
    11111
    11111
    11110
    11110
    11101
    11101
    11100
    11100
    11011
    11011
    11010
    11010
    11001
    11001
    11000
    11000
    10111
    10111
    10110
    10110
    10101
    10101
    10100
    10100
    10011
    10011
    10010
    10010
    10001
    10001
    10000
    10000
    01111
    01111
    01110
    01110
    01101
    01101
    01100
    01100
    01011
    01011
    */