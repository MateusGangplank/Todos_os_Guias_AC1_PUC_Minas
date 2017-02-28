// -------------------------
// - Guia 09 - Lucas Siqueira Chagas - 380783
// - Exercicio05.v
// -------------------------

// --------------------------- 
// --- Contador módulo 10     
// --------------------------- 

   module tff ( output q, output qnot, input t, input clk, input preset, input clear ); 
     reg q, qnot; 

    always @( posedge clk ) 
     
	   begin 
        if ( ~clear ) 
         begin 
           q <= 0; qnot <= 1; 
         end 
        else 
         if ( preset ) 
          begin 
           q <= 1; qnot <= ~q; 
          end 
         else 
          begin 
           if ( t ) 
            begin 
             q <= ~q; qnot <= ~q; 
            end 
           end 
          end 
     endmodule // tff 	
	  
// ------------------------------- 
	
		 module contadorMod10;
		  
         reg pulse, clr, preset;
			wire [3:0]q;
		   wire [3:0]qnot;
			wire s;
			wire saida;
	     

			and AND1(s, q[3], ~q[2], q[1], ~q[0]);
			or OR1 (saida, clr, s);
			/*
       tff TFF1 ( q[3], qnot[3], pulse, pulse, preset, saida);
	    tff TFF2 ( q[2], qnot[2], qnot[3], qnot[3], preset, saida); 
       tff TFF3 ( q[1], qnot[1], qnot[2], qnot[2], preset, saida); 
       tff TFF4 ( q[0], qnot[0], qnot[1], qnot[1], preset, saida); 
*/
			
       tff TFF1 ( q[3], qnot[3], pulse, pulse, preset, 0);
	    tff TFF2 ( q[2], qnot[2], qnot[3], qnot[3], preset, 0); 
       tff TFF3 ( q[1], qnot[1], qnot[2], qnot[2], preset, 0); 
       tff TFF4 ( q[0], qnot[0], qnot[1], qnot[1], preset, 0); 

 
// ------------------------------- 
      initial 
        begin 
          $display ("Contador módulo 10 ");
			 $display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 1; 
			 clr = 1;
			 preset = 0;

       // input signal changing 
		    #1 clr = 0;
 		    #1 preset = 0;
	       #270 $finish; 
        end // initial 

       always 
         #5 pulse = ~pulse; 

       always @( posedge pulse ) 
        begin 
           $display ( "%4d\t%1b\t%4b\t%1b\t%1b", $time, pulse, q, clr, s ); 
        end // always at positive edge clocking changing 

    endmodule // contadorMod10