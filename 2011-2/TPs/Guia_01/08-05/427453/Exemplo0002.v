// ------------------------- 
// Exemplo0002 - NOT 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// -- not gate 
// -------------------------  
module notgate (output s, 
                input p); 
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
 initial begin 
  $display("Exemplo 0001 - Pedro Henrique Vilar Locatelli - 427453"); 
  $display("Test NOT gate"); 
  $display("\n~a = s\n"); 
  a=0; 
 #1 $display("~%b = %b", a, s); 
  a=1; 
 #1 $display("~%b = %b", a, s); 
 end 
endmodule // testnotgate 