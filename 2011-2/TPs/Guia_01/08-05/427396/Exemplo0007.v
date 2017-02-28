// ------------------------- 
// Exemplo0007 - nor
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

// ------------------------- 
// -- buffer 
// ------------------------- 
module norgate (output s, input p, input q); 
 assign s = ~(p|q) ; 
endmodule //norgate
 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module testnorgate; 
// ------------------------- dados locais 
   reg   a, b;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0;
    end 
// ------------------------- parte principal 
 initial begin:main 
  $display("Exemplo 0007 - Eduardo Manoel - 427396"); 
  $display("Test norgate:"); 
  $display("\na NOR b = s\n"); 
  $monitor("%b NOR %b = %b", a, b, s);
  #1 b=1;
  #2 a=1; b=0;
  #3 b=1;
 end 
 
endmodule // testnorgate