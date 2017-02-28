// -------------------------
// Deslocamento circular em anel torcido para a esquerda 
// Nome: Ana Cristina Pereira Teixeira 
// Matricula: 427385
// -------------------------

// --------------------------- 
// --- Rotate Register (Left)   
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
	
		 module deslocamentoCirEsq; 
         reg clk, d; 
         wire [3:0]q;
		   wire qnot, d1;
	     
		  or OR1 (d1, d, q[3]);
		  
        dff DFF1 (q[0], qnot, d1, clk);
        dff DFF2 (q[1], qnot, q[0],clk); 
        dff DFF3 (q[2], qnot, q[1],clk); 
        dff DFF4 (q[3], qnot, q[2],clk); 
		  
// ------------------------------- 
      initial 
        begin 
          $display ("Deslocamento circular, em anel torcido, para a esquerda ");
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

    endmodule // deslocamentoCirEsq