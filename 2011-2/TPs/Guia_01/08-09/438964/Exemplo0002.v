 
// ------------------------- 
// Exemplo0002 - NOT
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.2
// ------------------------- 
 
// ------------------------- 
// -- not gate
// ------------------------- 
module notgate (output s, input p); 
assign s = ~p; // criar vinculo permanente 
                        // (dependencia) 
endmodule // not gate 
 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
   reg   a;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   notgate NOT1 (s, a); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; 
    end 
// ------------------------- parte principal 
// ------------------------- parte principal 
          initial begin 
      $display("Exemplo 0002 - Ederson Cristiano Nunes - 438964"); 
            $display("Test NOT gate"); 
            $display("\n~a = s\n"); 
            a=0; 
         #1  $display("~%b = %b", a, s); 
            a=1; 
         #1  $display("~%b = %b", a, s); 
        end 

       endmodule//testnotgate 
 

//Exemplo 0002 - Ederson Cristiano Nunes - 438964
//Test NOT gate
//~a = s
    
//~0 = 1
//~1 = 0
    
