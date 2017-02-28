// ------------------------- 
// Exemplo0012 - XNOR
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- xnor gate
// -------------------------
        
		    module xnorgate (output s, input p, q); 
             assign s = (p & q)|(~p & ~q);  
          endmodule // xnorgate 
			 
// ------------------------- 
// -- test xnor gate 
// -------------------------
         
			 module testxnorgate; 
			  
// ------------------------- dados locais 
         
			 reg a, b; // definir registrador 
          wire s; // definir conexao (fio) 

// ------------------------- instancia 
   
	       xnorgate XNOR1 (s, a, b); 
				 
// ------------------------- preparacao 
     
	       initial begin:start 
            a=0; b=0; 
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0012 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade XNOR"); 
                $display("\na b s\n"); 
                  a=0; b=0; 
             #1 $display("%b %b %b", a, b, s); 
                  a=0; b=1; 
             #1 $display("%b %b %b", a, b, s); 
                  a=1; b=0; 
             #1 $display("%b %b %b", a, b, s); 
                  a=1; b=1; 
             #1 $display("%b %b %b", a, b, s); 
			   end 
       endmodule // testXnorgate