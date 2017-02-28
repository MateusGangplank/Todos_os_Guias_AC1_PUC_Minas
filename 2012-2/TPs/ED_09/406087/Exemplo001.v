// -------------------------
// Exemplo01 
// Nome: Fabio Fiuza Pereira
// Matricula: 406087
// -------------------------

// --------------------------- 
// --- Contador Assíncrono Decrescente   
// --------------------------- 
module jkff ( output q, output qnot, input j, input k, input clr, input clk ); 
	
	  
	 reg q, qnot; 

    always @( posedge clk or posedge clr ) 
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
     endmodule // jkff 	
	  
// ------------------------------- 
	
		 module contadorDecDecresc;
		  
         reg pulse, clr; 
         wire [4:0]q;
		   wire [4:0]qnot;
		     
       jkff JKFF1 ( q[0], qnot[0], 1, 1, clr, pulse);
	    jkff JKFF2 ( q[1], qnot[1], 1, 1, clr, q[0] ); 
       jkff JKFF3 ( q[2], qnot[2], 1, 1, clr, q[1] ); 
       jkff JKFF4 ( q[3], qnot[3], 1, 1, clr, q[2] ); 
       jkff JKFF5 ( q[4], qnot[4], 1, 1, clr, q[3] ); 
 
// ------------------------------- 
      initial 
        begin 
          $display ("Contador Assíncrono Decrescente ");
			 $display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 0; 
			 clr = 1;

       // input signal changing  
		    #1 clr = 0;
	       #320 $finish; 
        end // initial 

       always 
         #5 pulse = ~pulse; 

       always @( posedge pulse ) 
        begin 
           $display ( "%4d\t%1b\t%4b", $time, pulse, q ); 
        end // always at positive edge clocking changing 

    endmodule // contadorAsDecresc