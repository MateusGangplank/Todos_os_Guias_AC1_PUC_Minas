// ------------------------- 
// Exemplo0016 - EXTRA
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- nor gate 
// ------------------------- 

      module norgate ( output s, input p, q, r, t, u, v, x, z); 
          assign s = ~(p | q | r | t | u | v | x | z); 
      endmodule // norgate 

// --------------------- 
// -- test nor gate 
// --------------------- 

      module testnorgate; 

// ------------------------- dados locais 

      reg a, b, c, d, e, f, g, h; // definir registradores 
      wire s; // definir conexao (fio) 

// ------------------------- instancia 
     
	   norgate NOR1 (s, a, b, c, d, e, f, g, h); 

// ------------------------- preparacao 

     initial begin:start 
        a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
      end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0016 - Michelle da Costa Silva - 427448"); 
                $display("\nExtra - NOR"); 
                $display("\na b c d e f g h s\n"); 
                   a=0; b=0; c=0; d=0; e=0; f=0; g=0; h=0;
             #1 $display("%b %b %b %b %b %b %b %b %b", a, b, c, d, e, f, g, h, s); 
             
			   end 
   endmodule // testnorgate 