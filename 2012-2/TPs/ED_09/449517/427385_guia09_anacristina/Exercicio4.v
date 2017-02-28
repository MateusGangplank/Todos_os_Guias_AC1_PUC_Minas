// -- PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// -- Exercicio04
// -- Nome: Ana Cristina Pereira Teixeira
// -- Matricula: 427385

// --------------------------- 
// --- Contador Decádico Crescente    
// --------------------------- 
module jkff ( output q, output qnot, input j, input k, input clr, input clk ); 
    
	 reg q, qnot; 

	 always @( posedge clk  or  clr ) 
			
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
	
		 module contadorDecCresc;
		  
         reg pulse, clr;
			wire [0:4]q;
		   wire [0:4]qnot;
			wire s, saida;
	     
		nand NAND1(s, ~q[4], q[3], ~q[2], q[1], ~q[0]);
	   nand NAND2 (saida, clr, s);
	 
       jkff JKFF1 ( q[4], qnot[4], 1, 1, saida, pulse);
	    jkff JKFF2 ( q[3], qnot[3], 1, 1, saida, qnot[4] ); 
       jkff JKFF3 ( q[2], qnot[2], 1, 1, saida, qnot[3] ); 
       jkff JKFF4 ( q[1], qnot[1], 1, 1, saida, qnot[2] ); 
       jkff JKFF5 ( q[0], qnot[0], 1, 1, saida, qnot[1] ); 
 
// ------------------------------- 
      initial 
        begin 
          $display ("Contador Decádico Crescente");
			 $display("Ana Cristina - 427385");
			 $display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 0; 
			 clr = 0;

       // input signal changing  
		    #1 clr = 1;
	       #270 $finish; 
        end // initial 

       always 
         #5 pulse = ~pulse; 

       always @( posedge pulse ) 
        begin 
           $display ( "%5d\t%1b\t%5b", $time, pulse, q ); 
        end // always at positive edge clocking changing 

    endmodule // contadorDecCresc
// -- previsao de testes
// -- Time	Dado	Saida
// --    5	1	11111
// --   15	1	00000
// --   25	1	00001
// --   35	1	00010
// --   45	1	00011
// --   55	1	00100
// --   65	1	00101
// --   75	1	00110
// --   85	1	00111
// --   95	1	01000
// --  105	1	01001
// --  115	1	11111
// --  125	1	00000
// --  135	1	00001
// --  145	1	00010
// --  155	1	00011
// --  165	1	00100
// --  175	1	00101
// --  185	1	00110
// --  195	1	00111
// --  205	1	01000
// --  215	1	01001
// --  225	1	11111
// --  235	1	00000
// --  245	1	00001
// --  255	1	00010
// --  265	1	00011