// ------------------------- 
// Exemplo0011 - xor
// Nome: Michelle da Costa Silva
// Matricula: 427448
// ------------------------- 

// --------------------- 
// -- xor gate 
// --------------------- 

      module xorgate (output s, input p, input q); 
          assign s = (~p & q)|(p & ~q) ;
      endmodule // xor 

// --------------------- 
// -- test xorgate 
// --------------------- 

       module testxorgate; 

// ------------------------- dados locais 

       reg a,b; // definir registrador 
       wire s; // definir conexao (fio) 

// ------------------------- instancia 

       xorgate XOR1 (s, a, b); 

// ------------------------- preparacao 

       initial begin:start 
            a=0; b=0; 
           end 
				  
// ------------------------- parte principal 
         
			  initial begin:main 
                $display("Exemplo 0011 - Michelle da Costa Silva - 427448"); 
                $display("\nTabela-verdade XOR"); 
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
     endmodule // testxorgate 