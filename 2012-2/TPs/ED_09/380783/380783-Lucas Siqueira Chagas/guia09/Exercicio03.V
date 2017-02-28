// -------------------------
// - Guia 09 - Lucas Siqueira Chagas - 380783
// - Exercicio03.v
// -------------------------

// --------------------------- 
// --- Contador Decádico     
// --------------------------- 

    module jkff ( output q, output qnot, input j, input k, input clr, input preset, input clk ); 
    
	 reg q, qnot; 

	 always @( posedge clk  or  preset ) 
			
	begin 
	    	if(preset)
			begin
			 q = 1;
			 qnot = 0;
			end
	 begin 
			if (clr)
			begin
		 	 q = 0;
			 qnot = 1;
			end 
    begin 
       if ( j & ~k ) 
        begin 
         q <= 1; qnot <= 0; 
        end 
       else 
         if ( ~j & k ) 
          begin 
            q <= 0; qnot <= 1; 
          end 
         else 
          if ( j & k ) 
           begin 
             q <= ~q; qnot <= ~qnot; 
           end 
      end 
	 end	
	end 
     endmodule // jkff 	
	  
// ------------------------------- 
	
		 module contadorDec;
		  
         reg pulse, clr;
			reg preset; 
			wire [0:5]q;
		   wire [0:5]qnot;
	     
		
	 
       jkff JKFF1 ( q[5], qnot[5], 1, 1, clr, preset, pulse);
	    jkff JKFF2 ( q[4], qnot[4], 1, 1, clr, preset, qnot[5] ); 
       jkff JKFF3 ( q[3], qnot[3], 1, 1, clr, preset, qnot[4] ); 
       jkff JKFF4 ( q[2], qnot[2], 1, 1, clr, preset, qnot[3] ); 
       jkff JKFF5 ( q[1], qnot[1], 1, 1, clr, preset, qnot[2] ); 
       jkff JKFF6 ( q[0], qnot[0], 1, 1, clr, preset, qnot[1] ); 
		 and AND1(s, ~qnot[4], qnot[3], ~qnot[2], qnot[1], qnot[0]);
 
// ------------------------------- 
      initial 
        begin 
          $display ("Contador Decádico Decrescente");
			 $display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 0; 
			 clr = 1;
			 preset = 0;

       // input signal changing  
		    #1 clr = 0;
			 #115 clr = 1;
			 #116 clr = 0;
	       #270 $finish; 
        end // initial 

       always 
		 begin
         #5 pulse = ~pulse; 
		//	#115 clr = 1;
		end		
       always @( posedge pulse ) 
        begin 
           $display ( "%4d\t%1b\t%4b", $time, pulse, q );
        end //  

    endmodule // contadorDec