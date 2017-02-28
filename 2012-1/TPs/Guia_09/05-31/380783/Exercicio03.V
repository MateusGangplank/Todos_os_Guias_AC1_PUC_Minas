// -------------------------
// - Guia 09 - Lucas Siqueira Chagas - 380783
// - Exercicio03.v
// -------------------------

// --------------------------- 
// --- Contador Decádico Decrescente    
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
	
		 module contadorDecDecresc;
		  
         reg pulse, clr;
			wire preset; 
			wire [0:4]q;
		   wire [0:4]qnot;
			wire s;
	     
		and AND1(s, ~qnot[4], qnot[3], ~qnot[2], qnot[1], qnot[0]);
	   or OR1 (preset,0, s);
	 
       jkff JKFF1 ( q[4], qnot[4], 1, 1, clr, preset, pulse);
	    jkff JKFF2 ( q[3], qnot[3], 1, 1, clr, preset, q[4] ); 
       jkff JKFF3 ( q[2], qnot[2], 1, 1, clr, preset, q[3] ); 
       jkff JKFF4 ( q[1], qnot[1], 1, 1, clr, preset, q[2] ); 
       jkff JKFF5 ( q[0], qnot[0], 1, 1, clr, preset, q[1] ); 
 
// ------------------------------- 
      initial 
        begin 
          $display ("Contador Decádico Decrescente");
			 $display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 0; 
			 clr = 1;

       // input signal changing  
		    #1 clr = 0;
	       #270 $finish; 
        end // initial 

       always 
         #5 pulse = ~pulse; 

       always @( posedge pulse ) 
        begin 
           $display ( "%4d\t%1b\t%4b", $time, pulse, q ); 
        end //  

    endmodule // contadorDecDecresc