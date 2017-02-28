// -- PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// -- Exercicio05
// -- Nome: Ana Cristina Pereira Teixeira
// -- Matricula: 427385

// --------------------------- 
// --- Contador módulo 8     
// --------------------------- 
module tff ( output q, output qnot, input t, input clk, input preset, input clear );
	reg q, qnot; 

    always @( posedge clk ) 
     
	   begin 
        if ( ~clear ) 
         begin 
           q <= 0; qnot <= ~q; 
         end 
        else 
         if ( ~preset ) 
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
	module contadorMod8;
		
		reg pulse, clr, preset;
		wire [3:0]q;
		wire [3:0]qnot;
		wire s, saida;
	     
		and AND1(s,q[3], ~q[2], ~q[1], ~q[0]);
		or OR1 (saida, clr, s);
		
		tff TFF1 ( q[0], qnot[0], 1, pulse, preset, saida);
		tff TFF2 ( q[1], qnot[1], qnot[0], qnot[0], preset, saida); 
		tff TFF3 ( q[2], qnot[2], qnot[1], qnot[1], preset, saida);
		tff TFF4 ( q[3], qnot[3], qnot[2], qnot[2], preset, saida);
//--		tff TFF5 ( q[4], qnot[4], qnot[3], qnot[3], preset, saida );
 
// ------------------------------- 
      initial 
        begin 
       $display ("Contador módulo 8 ");
		 $display("Ana Cristina - 427385");
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
           $display ( "%5d\t%1b\t%5b\t%1b\t%1b", $time, pulse, q, clr, s ); 
        end // always at positive edge clocking changing 

    endmodule // contadorMod8