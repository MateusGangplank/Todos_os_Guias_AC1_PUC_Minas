// -------------------------
// Memória RAM 1x1 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// --------------------------- 
// --- Memória RAM 1x1 
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

		 module Mem_1por1 (output saida, input entrada, input clk, input addr, input rw,  input clr);
		  
         wire q, qnot;
			wire s;
			
		  and AND1 (s, addr, rw, clk );    
        jkff JKFF1 (q, qnot, entrada, entrada, clr, clk);
	     and AND2 (saida, addr, q);
		  
       endmodule // Mem_1por1
	 
	