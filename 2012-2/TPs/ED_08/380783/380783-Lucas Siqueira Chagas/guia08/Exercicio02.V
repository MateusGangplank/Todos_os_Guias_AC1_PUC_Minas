// -------------------------
// Deslocamento para a esquerda  
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// -------------------------

// --------------------------- 
// --- (Left) Shift Register  
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

		 module deslocamentoEsq;
         reg clk, d;
         wire [4:0]q;
		   wire qnot;

        dff DFF1 (q[0], qnot, d, clk);
        dff DFF2 (q[1], qnot, q[0],clk);
        dff DFF3 (q[2], qnot, q[1],clk);
        dff DFF4 (q[3], qnot, q[2],clk);
		  dff DFF5 (q[4], qnot, q[3],clk);

// -------------------------------

       initial
        begin
          $display ( "Deslocamento para esquerda" );
			 $display ( "Time\tClock\tDado\tSaida\t");


       // initial values
          clk = 0;
          d = 1;

       // input signal changing
          #10 d = 1;
          #10 d = 1;
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

    endmodule // deslocamentoEsq
