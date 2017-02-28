// ------------------------- 
// Exemplo0003 - AND  
// Nome: Michelle da Costa Silva
// Matricula: 427448 
// ------------------------- 

// ------------------------- 
// -- and gate
// -------------------------
          module andgate (output s, input p, input q); 
          assign s = p & q;  
          endmodule // andgate 
			 
// ------------------------- 
// -- test and gate 
// -------------------------
           module testandgate; 
			  
// ------------------------- dados locais 
            reg a, b; // definir registrador 
            wire s; // definir conexao (fio) 

// ------------------------- instancia 
             andgate AND1 (s, a, b); 
				 
// ------------------------- preparacao 
              initial begin:start 
              a=0; b=0; 
              end 
				  
// ------------------------- parte principal 
      initial begin:main 
              $display("Exemplo 0003 - Michelle da Costa Silva - 427448"); 
              $display("Test AND gate"); 
              $display("\na & b = s\n"); 
              a=0; b=0; 
           #1 $display("%b & %b = %b", a, b, s); 
              a=0; b=1; 
           #1 $display("%b & %b = %b", a, b, s); 
              a=1; b=0; 
           #1 $display("%b & %b = %b", a, b, s); 
              a=1; b=1; 
           #1 $display("%b & %b = %b", a, b, s); 
			     end 
              endmodule // testandgate