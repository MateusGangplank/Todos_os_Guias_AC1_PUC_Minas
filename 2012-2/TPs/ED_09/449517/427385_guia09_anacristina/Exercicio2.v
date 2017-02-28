// -- PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// -- Exercicio02
// -- Nome: Ana Cristina Pereira Teixeira
// -- Matricula: 427385

// --------------------------- 
// --- Contador Assíncrono Crescente   
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
	
		 module contadorAsCresc;
		  
         reg pulse, clr; 
         wire [4:0]q;
		   wire [4:0]qnot;
	     
       jkff JKFF1 ( q[0], qnot[0], 1, 1, clr, pulse);
	    jkff JKFF2 ( q[1], qnot[1], 1, 1, clr, qnot[0] ); 
       jkff JKFF3 ( q[2], qnot[2], 1, 1, clr, qnot[1] ); 
       jkff JKFF4 ( q[3], qnot[3], 1, 1, clr, qnot[2] ); 
       jkff JKFF5 ( q[4], qnot[4], 1, 1, clr, qnot[3] ); 
 
// ------------------------------- 
      initial 
        begin
		  	$display ("Contador Assíncrono Crescente ");
			$display("Ana Cristina - 427385");
			$display ("Time\tDado\tSaida\t");

	    // initial values 
          pulse = 0; 
			 clr = 1;

       // input signal changing  
		    #1 clr = 0;
	       #340 $finish; 
        end // initial 

       always 
         #5 pulse = ~pulse; 

       always @( posedge pulse ) 
        begin 
           $display ( "%5d\t%1b\t%5b", $time, pulse, q ); 
        end // always at positive edge clocking changing 

    endmodule // contadorAsCresc
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
// --  115	1	01010
// --  125	1	01011
// --  135	1	01100
// --  145	1	01101
// --  155	1	01110
// --  165	1	01111
// --  175	1	10000
// --  185	1	10001
// --  195	1	10010
// --  205	1	10011
// --  215	1	10100
// --  225	1	10101
// --  235	1	10110
// --  245	1	10111
// --  255	1	11000
// --  265	1	11001
// --  275	1	11010
// --  285	1	11011
// --  295	1	11100
// --  305	1	11101
// --  315	1	11110
// --  325	1	11111
// --  335	1	00000