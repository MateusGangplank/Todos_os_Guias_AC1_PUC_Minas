// ------------------------- 
// Exemplo0004 - OR  
// Nome: Michelle da Costa Silva
// Matricula: 427448 
// ------------------------- 

// ------------------------- 
// -- or gate
// -------------------------
          module orgate (output s, input p, q); 
          assign s = p | q;  
          endmodule // orgate 
			 
// ------------------------- 
// -- test or gate 
// -------------------------
           module testorgate; 
			  
// ------------------------- dados locais 
            reg a, b; // definir registrador 
            wire s; // definir conexao (fio) 

// ------------------------- instancia 
             orgate OR1 (s, a, b); 
				 
// ------------------------- preparacao 
              initial begin:start 
              a=0; b=0; 
              end 
				  
// ------------------------- parte principal 
      initial begin:main 
              $display("Exemplo 0004 - Michelle da Costa Silva - 427448"); 
              $display("Test OR gate"); 
              $display("\na & b = s\n"); 
              a=0; b=0; 
           #1 $display("%b | %b = %b", a, b, s); 
              a=0; b=1; 
           #1 $display("%b | %b = %b", a, b, s); 
              a=1; b=0; 
           #1 $display("%b | %b = %b", a, b, s); 
              a=1; b=1; 
           #1 $display("%b | %b = %b", a, b, s); 
			     end 
              endmodule // testorgate