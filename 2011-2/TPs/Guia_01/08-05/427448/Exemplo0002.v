// ------------------------- 
// Exemplo0002 - NOT  
// Nome: Michelle da Costa Silva
// Matricula: 427448 
// ------------------------- 

// ------------------------- 
// -- not gate
// -------------------------
          module notgate (output s, input p); 
          assign s = ~p;  
          endmodule // notgate 
			 
// ------------------------- 
// -- test not gate 
// -------------------------
           module testnotgate; 
			  
// ------------------------- dados locais 
            reg a; // definir registrador 
// (variavel independente) 
            wire s; // definir conexao (fio) 
// (variavel dependente ) 

// ------------------------- instancia 
             notgate NOT1 (s, a); 
				 
// ------------------------- preparacao 
              initial begin:start 
              a=0; 
              end 
				  
// ------------------------- parte principal 
              initial begin:main 
              $display("Exemplo 0002 - Michelle da Costa Silva - 427448"); 
              $display("Test NOT gate:"); 
              $display("\n~a = s\n"); 
              a=0; 
           #1 $display("~%b = %b", a, s); 
              a=1; 
           #1 $display("~%b = %b", a, s);
			     end 
              endmodule // testnotgate