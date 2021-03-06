// ------------------------- 
// Exemplo0006 - NAND
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// -- nand gate
// -------------------------
        
		    module nandgate (output s, input p, q); 
             assign s = ~(p & q);  
          endmodule // nandgate 
			 
// ------------------------- 
// -- test nand gate 
// -------------------------
         
			 module testnandgate; 
			  
// ------------------------- dados locais 
         
			 reg a, b; // definir registrador 
          wire s; // definir conexao (fio) 

// ------------------------- instancia 
   
	       nandgate NAND1 (s, a, b); 
				 
// ------------------------- preparacao 
     
	       initial begin:start 
            a=0; b=0; 
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0006 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade NAND"); 
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
       endmodule // testnandgate