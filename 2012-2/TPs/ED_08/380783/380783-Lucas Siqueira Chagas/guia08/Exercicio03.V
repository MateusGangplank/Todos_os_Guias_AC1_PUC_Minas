// -------------------------
// Deslocamento circular para a direita
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// -------------------------

// --------------------------- 
// --- Rotate Register (Right)   
// --------------------------- 

    module dff ( output q, output qnot, input d, input clk ); 
     reg q, qnot; 
    
	 always @( posedge clk ) 
     begin 

//       q <= d; qnot <= ~q; 
       q <= d; qnot <= ~d;

     end
    endmodule // dff 
	
// ------------------------------- 
	
		 module deslocamentoCirDir; 
         reg clk, d; 
         wire [4:0]q;
		   wire qnot, d1;
	     
		  or OR1 (d1, d, q[0]);
		  dff DFF0 (q[4], qnot, d1, clk);
        dff DFF1 (q[3], qnot, q[4], clk);
        dff DFF2 (q[2], qnot, q[3],clk); 
        dff DFF3 (q[1], qnot, q[2],clk); 
        dff DFF4 (q[0], qnot, q[1],clk); 
		  
// ------------------------------- 
      initial 
        begin 
          $display ("Deslocamento circular para a direita");
			 $display ("Time\tClock\tDado\tSaida\t");

	    // initial values 
          clk = 0; 
          d = 1;

       // input signal changing  
          #10 d = 1; 
			 #10 d = 1; 
          #10 d = 0; 
          #10 d = 0; 
          #20 d = 1; 
      
	       #30 $finish; 
        end // initial 

       always 
          #5 clk = ~clk; 

       always @( posedge clk ) 
        begin 
           $display ( "%4d\t%1b\t%1b\t%4b", $time, clk, d, q ); 
        end // always at positive edge clocking changing 

    endmodule // deslocamentoCirDir