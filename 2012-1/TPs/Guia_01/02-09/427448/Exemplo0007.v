// ------------------------- 
// Exemplo0007 - NOR
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- nor gate
// -------------------------
        
		    module norgate (output s, input p, q); 
             assign s = ~(p | q);  
          endmodule // norgate 
			 
// ------------------------- 
// -- test nor gate 
// -------------------------
         
			 module testnorgate; 
			  
// ------------------------- dados locais 
         
			 reg a, b; // definir registrador 
          wire s; // definir conexao (fio) 

// ------------------------- instancia 
   
	       norgate NOR1 (s, a, b); 
				 
// ------------------------- preparacao 
     
	       initial begin:start 
            a=0; b=0; 
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0007 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade NOR"); 
                $display("\na b s\n"); 
                $monitor ("%b %b %b", a, b, s); 
             #1  a=0; b=1; 
             #1  a=1; b=0; 
             #1  a=1; b=1; 
           end 
       endmodule // testnorgate