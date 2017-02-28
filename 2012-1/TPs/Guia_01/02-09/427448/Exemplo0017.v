// -------------------------
// Exemplo0017 - Extra 
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- and gate 
// ------------------------- 

       module andgate ( output s, input p, q, r, t, u, v, x, z); 
		    assign s = p & q & r & t & u & v & x & z; 

       endmodule // andgate 

// --------------------- 
// -- test and gate 
// ---------------------

       module testandgate; 

// ------------------------- dados locais 
       
		 reg a, b, c, d, e, f, g, h; // definir registradores 
      wire s; // definir conexao (fio) 

// ------------------------- instancia 
 
       andgate AND1 (s, a, b, c, d, e, f, g, h); 

// ------------------------- preparacao 
     
	    initial begin:start 
            a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1;
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0017 - Michelle da Costa Silva - 427448"); 
                $display("\nExtra - AND"); 
                $display("\na b c d e f g h s\n"); 
                   a=1; b=1; c=1; d=1; e=1; f=1; g=1; h=1;
             #1 $display("%b %b %b %b %b %b %b %b %b", a, b, c, d, e, f, g, h, s); 

// OBS.: INCLUIR MAIS TESTES (MELHOR USAR $monitor)

			   end 
     endmodule // testandgate 